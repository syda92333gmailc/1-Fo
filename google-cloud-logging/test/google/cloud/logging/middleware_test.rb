# Copyright 2016 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


require "helper"

describe Google::Cloud::Logging::Middleware, :mock_logging do
  let(:app_exception_msg) { "A serious error from application" }
  let(:service_name) { "My microservice" }
  let(:service_version) { "Version testing" }
  let(:trace_id) { "1234567890abcdef1234567890abcdef" }
  let(:trace_context) { "#{trace_id}/123456;o=1" }
  let(:rack_env) {{
    "HTTP_X_CLOUD_TRACE_CONTEXT" => trace_context,
    "PATH_INFO" => "/_ah/health"
  }}
  let(:app_exception) { StandardError.new(app_exception_msg) }
  let(:rack_app) {
    app = OpenStruct.new
    def app.call(_) end
    app
  }
  let(:log_name) { "web_app_log" }
  let(:resource) do
    Google::Cloud::Logging::Resource.new.tap do |r|
      r.type = "gce_instance"
      r.labels["zone"] = "global"
      r.labels["instance_id"] = "abc123"
    end
  end
  let(:labels) { { "env" => "production" } }
  let(:logger) { Google::Cloud::Logging::Logger.new logging, log_name, resource, labels }
  let(:middleware) {
    Google::Cloud::Logging::Middleware.new rack_app, logger: logger,
                                                     project_id: project
  }

  before do
    # Clear configuration values between each test
    Google::Cloud.configure.reset!
  end

  after do
    # Clear configuration values between each test
    Google::Cloud.configure.reset!
  end

  describe "#initialize" do
    let(:default_credentials) do
      creds = OpenStruct.new empty: true
      def creds.is_a? target
        target == Google::Auth::Credentials
      end
      creds
    end

    it "creates a default logger object if one isn't provided" do
      Google::Cloud::Logging.stub :default_project_id, project do
        Google::Cloud::Logging::Credentials.stub :default, default_credentials do
          middleware = Google::Cloud::Logging::Middleware.new rack_app
        end
      end

      _(middleware.logger).must_be_kind_of Google::Cloud::Logging::Logger
    end

    it "uses the logger provided if given" do
      _(middleware.logger).must_equal logger
    end

    it "invokes the on_init callback when provided" do
      mock = Minitest::Mock.new
      mock.expect :callback_was_called, nil

      on_init_callback = -> { mock.callback_was_called }

      middleware = Google::Cloud::Logging::Middleware.new \
        rack_app, logger: logger, on_init: on_init_callback

      mock.verify
    end
  end

  describe "#call" do
    it "sets env[\"rack.logger\"] to the given logger" do
      stubbed_call = ->(env) {
        _(env["rack.logger"]).must_equal logger
      }
      rack_app.stub :call, stubbed_call do
        middleware.call rack_env
      end
    end

    it "calls logger.add_request_info to track trace_id" do
      stubbed_add_request_info = ->(args) {
        _(args[:trace_id]).must_equal trace_id
        _(args[:env]).must_equal rack_env
      }
      logger.stub :add_request_info, stubbed_add_request_info do
        middleware.call rack_env
      end
    end

    it "calls logger.add_request_info to log_name" do
      ["/healthz", "/_ah/health"].each do |path|
        rack_env = { "PATH_INFO" => path }
        stubbed_add_request_info = ->(args) {
          _(args[:log_name]).must_equal "ruby_health_check_log"
        }
        logger.stub :add_request_info, stubbed_add_request_info do
          middleware.call rack_env
        end
      end
    end

    it "calls logger.delete_request_info when exiting even app.call fails" do
      method_called = false
      stubbed_delete_request_info = ->() {
        method_called = true
      }
      stubbed_call = ->(_) { raise "die" }

      logger.stub :delete_request_info, stubbed_delete_request_info do
        rack_app.stub :call, stubbed_call do
          assert_raises StandardError do
            middleware.call rack_env
          end
          _(method_called).must_equal true
        end
      end
    end
  end

  describe ".build_monitored_resource" do
    let(:custom_type) { "custom-monitored-resource-type" }
    let(:custom_labels) { {label_one: 1, label_two: 2} }
    let(:default_rc) { "Default-monitored-resource" }

    it "returns resource of right type if given parameters" do
      Google::Cloud::Logging::Middleware.stub :default_monitored_resource, default_rc do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource custom_type, custom_labels
        _(rc.type).must_equal custom_type
        _(rc.labels).must_equal custom_labels
      end
    end

    it "returns default monitored resource if only given type" do
      Google::Cloud::Logging::Middleware.stub :default_monitored_resource, default_rc do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource custom_type
        _(rc).must_equal default_rc
      end
    end

    it "returns default monitored resource if only given labels" do
      Google::Cloud::Logging::Middleware.stub :default_monitored_resource, default_rc do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource nil, custom_labels
        _(rc).must_equal default_rc
      end
    end
  end

  describe ".default_monitored_resource" do
    it "returns resource of type gae_app if app_engine? is true" do
      Google::Cloud.stub :env, OpenStruct.new(:app_engine? => true, :container_engine? => false, :compute_engine? => true) do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource
        _(rc.type).must_equal "gae_app"
      end
    end

    it "returns resource of type container if container_engine? is true" do
      Google::Cloud.stub :env, OpenStruct.new(:app_engine? => false, :container_engine? => true, :compute_engine? => true) do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource
        _(rc.type).must_equal "container"
      end
    end

    it "returns resource of type gce_instance if compute_engine? is true" do
      Google::Cloud.stub :env, OpenStruct.new(:app_engine? => false, :container_engine? => false, :compute_engine? => true) do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource
        _(rc.type).must_equal "gce_instance"
      end
    end

    it "returns resource of type global if not on GCP" do
      Google::Cloud.stub :env, OpenStruct.new(:app_engine? => false, :container_engine? => false, :compute_engine? => false) do
        rc = Google::Cloud::Logging::Middleware.build_monitored_resource
        _(rc.type).must_equal "global"
      end
    end
  end
end
