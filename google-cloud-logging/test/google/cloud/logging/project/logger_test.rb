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

describe Google::Cloud::Logging::Project, :logger, :mock_logging do
  it "creates a ruby logger object" do
    log_name = "web_app_log"
    resource = Google::Cloud::Logging::Resource.new.tap do |r|
      r.type = "web_app_server"
    end
    labels = { "env" => "production" }

    logger = logging.logger log_name, resource, labels
    _(logger).must_be_kind_of Google::Cloud::Logging::Logger
    _(logger.log_name).must_equal log_name
    _(logger.resource).must_equal resource
    _(logger.labels).must_equal labels
    _(logger.writer).must_be_kind_of Google::Cloud::Logging::AsyncWriter
  end

  it "creates a ruby logger object with labels using symbols" do
    log_name = "web_app_log"
    resource = Google::Cloud::Logging::Resource.new.tap do |r|
      r.type = "web_app_server"
    end
    labels = { env: "production" }

    logger = logging.logger log_name, resource, labels
    _(logger).must_be_kind_of Google::Cloud::Logging::Logger
    _(logger.log_name).must_equal log_name
    _(logger.resource).must_equal resource
    _(logger.labels).must_equal labels
    _(logger.writer).must_be_kind_of Google::Cloud::Logging::AsyncWriter
  end

  it "creates a ruby logger object without labels" do
    log_name = "web_app_log"
    resource = Google::Cloud::Logging::Resource.new.tap do |r|
      r.type = "web_app_server"
    end

    logger = logging.logger log_name, resource
    _(logger).must_be_kind_of Google::Cloud::Logging::Logger
    _(logger.log_name).must_equal log_name
    _(logger.resource).must_equal resource
    _(logger.labels).must_be :empty?
    _(logger.writer).must_be_kind_of Google::Cloud::Logging::AsyncWriter
  end
end
