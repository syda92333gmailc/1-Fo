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
require "google/cloud/resource_manager"

describe Google::Cloud do
  describe "#resource_manager" do
    it "calls out to Google::Cloud.resource_manager" do
      gcloud = Google::Cloud.new
      stubbed_resource_manager = ->(keyfile, options) {
        _(keyfile).must_be :nil?
        _(options[:scope]).must_be :nil?
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource_manager-manager-object-empty"
      }
      Google::Cloud.stub :resource_manager, stubbed_resource_manager do
        manager = gcloud.resource_manager
        _(manager).must_equal "resource_manager-manager-object-empty"
      end
    end

    it "passes project and keyfile to Google::Cloud.resource_manager" do
      gcloud = Google::Cloud.new "project-id", "keyfile-path"
      stubbed_resource_manager = ->(keyfile, options) {
        _(keyfile).must_equal "keyfile-path"
        _(options[:scope]).must_be :nil?
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource_manager-manager-object"
      }
      Google::Cloud.stub :resource_manager, stubbed_resource_manager do
        manager = gcloud.resource_manager
        _(manager).must_equal "resource_manager-manager-object"
      end
    end

    it "passes project and keyfile and options to Google::Cloud.resource_manager" do
      gcloud = Google::Cloud.new "project-id", "keyfile-path"
      stubbed_resource_manager = ->(keyfile, options) {
        _(keyfile).must_equal "keyfile-path"
        _(options[:scope]).must_equal "http://example.com/scope"
        _(options[:retries]).must_equal 5
        _(options[:timeout]).must_equal 60
        _(options[:host]).must_be :nil?
        "resource_manager-manager-object-scoped"
      }
      Google::Cloud.stub :resource_manager, stubbed_resource_manager do
        manager = gcloud.resource_manager scope: "http://example.com/scope", retries: 5, timeout: 60
        _(manager).must_equal "resource_manager-manager-object-scoped"
      end
    end
  end

  describe ".resource_manager" do
    let(:default_credentials) do
      creds = OpenStruct.new empty: true
      def creds.is_a? target
        target == Google::Auth::Credentials
      end
      creds
    end
    let(:found_credentials) { "{}" }

    it "gets defaults for project_id and keyfile" do
      # Clear all environment variables
      ENV.stub :[], nil do
        Google::Cloud::ResourceManager::Credentials.stub :default, default_credentials do
          resource_manager = Google::Cloud.resource_manager
          _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
          _(resource_manager.service.credentials).must_equal default_credentials
        end
      end
    end

    it "uses provided project_id and keyfile" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud.resource_manager "path/to/keyfile.json"
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end
  end

  describe "ResourceManager.new" do
    let(:default_credentials) do
      creds = OpenStruct.new empty: true
      def creds.is_a? target
        target == Google::Auth::Credentials
      end
      creds
    end
    let(:found_credentials) { "{}" }

    it "gets defaults for project_id and keyfile" do
      # Clear all environment variables
      ENV.stub :[], nil do
        Google::Cloud::ResourceManager::Credentials.stub :default, default_credentials do
          resource_manager = Google::Cloud::ResourceManager.new
          _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
          _(resource_manager.service.credentials).must_equal default_credentials
        end
      end
    end

    it "uses provided credentials" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new credentials: "path/to/keyfile.json"
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses provided keyfile alias" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new keyfile: "path/to/keyfile.json"
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses provided endpoint" do
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal default_credentials
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_equal "rm-endpoint2.example.com"
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
          resource_manager = Google::Cloud::ResourceManager.new credentials: default_credentials, endpoint: "rm-endpoint2.example.com"
          _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
          _(resource_manager.service).must_equal "resource-manager-service"
        end
      end
    end
  end

  describe "ResourceManager.configure" do
    let(:found_credentials) { "{}" }

    after do
      Google::Cloud.configure.reset!
    end

    it "uses shared config for project and keyfile" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        # Set new configuration
        Google::Cloud.configure do |config|
          config.project = "project-id"
          config.keyfile = "path/to/keyfile.json"
        end

        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses shared config for project_id and credentials" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_be :nil?
        _(options[:timeout]).must_be :nil?
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        # Set new configurations
        Google::Cloud.configure do |config|
          config.project_id = "project-id"
          config.credentials = "path/to/keyfile.json"
        end

        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses resource_manager config for project and keyfile" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_equal 3
        _(options[:timeout]).must_equal 42
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        # Set new configuration
        Google::Cloud::ResourceManager.configure do |config|
          config.keyfile = "path/to/keyfile.json"
          config.retries = 3
          config.timeout = 42
        end

        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses resource_manager config for project_id and credentials" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_equal 3
        _(options[:timeout]).must_equal 42
        _(options[:host]).must_be :nil?
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        # Set new configurations
        Google::Cloud::ResourceManager.configure do |config|
          config.credentials = "path/to/keyfile.json"
          config.retries = 3
          config.timeout = 42
        end

        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses resource_manager config for endpoint" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_equal 3
        _(options[:timeout]).must_equal 42
        _(options[:host]).must_equal "rm-endpoint2.example.com"
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        # Set new configurations
        Google::Cloud::ResourceManager.configure do |config|
          config.credentials = "path/to/keyfile.json"
          config.retries = 3
          config.timeout = 42
          config.endpoint = "rm-endpoint2.example.com"
        end

        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end

    it "uses resource_manager config for quota project" do
      stubbed_credentials = ->(keyfile, options = {}) {
        _(keyfile).must_equal "path/to/keyfile.json"
        _(options[:scope]).must_be :nil?
        "resource_manager-credentials"
      }
      stubbed_service = ->(credentials, options) {
        _(credentials).must_equal "resource_manager-credentials"
        _(options[:retries]).must_equal 3
        _(options[:timeout]).must_equal 42
        _(options[:quota_project]).must_equal "project-id-2"
        "resource-manager-service"
      }

      # Clear all environment variables
      ENV.stub :[], nil do
        # Set new configurations
        Google::Cloud::ResourceManager.configure do |config|
          config.credentials = "path/to/keyfile.json"
          config.retries = 3
          config.timeout = 42
          config.quota_project = "project-id-2"
        end

        File.stub :file?, true, ["path/to/keyfile.json"] do
          File.stub :read, found_credentials, ["path/to/keyfile.json"] do
            Google::Cloud::ResourceManager::Credentials.stub :new, stubbed_credentials do
              Google::Cloud::ResourceManager::Service.stub :new, stubbed_service do
                resource_manager = Google::Cloud::ResourceManager.new
                _(resource_manager).must_be_kind_of Google::Cloud::ResourceManager::Manager
                _(resource_manager.service).must_equal "resource-manager-service"
              end
            end
          end
        end
      end
    end
  end
end
