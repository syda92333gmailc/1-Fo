# Copyright 2017 Google LLC
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

describe Google::Cloud do
  describe '#error_reporting' do
    it "calls out to Google::Cloud.error_reporting" do
      gcloud = Google::Cloud.new
      stubbed_error_reporting =
        ->(project, keyfile, scope: nil, timeout: nil) {
          _(project).must_be_nil
          _(keyfile).must_be_nil
          _(scope).must_be :nil?
          _(timeout).must_be :nil?
          "fake-error_reporting-project-object"
        }
      Google::Cloud.stub :error_reporting, stubbed_error_reporting do
        project = gcloud.error_reporting
        _(project).must_equal "fake-error_reporting-project-object"
      end
    end

    it "passes project and keyfile to Google::Cloud.error_reporting" do
      gcloud = Google::Cloud.new "test-project-id", "/path/to/a/keyfile"
      stubbed_error_reporting =
        ->(project, keyfile, scope: nil, timeout: nil) {
          _(project).must_equal "test-project-id"
          _(keyfile).must_equal "/path/to/a/keyfile"
          _(scope).must_be :nil?
          _(timeout).must_be :nil?
          "error_reporting-project-object"
        }
      Google::Cloud.stub :error_reporting, stubbed_error_reporting do
        project = gcloud.error_reporting
        _(project).must_equal "error_reporting-project-object"
      end
    end

    it "passes project and keyfile and options to Google::Cloud.error_reporting" do
      gcloud = Google::Cloud.new "test-project-id", "/path/to/a/keyfile"
      stubbed_error_reporting =
        ->(project, keyfile, scope: nil, timeout: nil) {
          _(project).must_equal "test-project-id"
          _(keyfile).must_equal "/path/to/a/keyfile"
          _(scope).must_equal "http://example.com/scope"
          _(timeout).must_equal 60
          "error_reporting-project-object"
        }
      Google::Cloud.stub :error_reporting, stubbed_error_reporting do
        project = gcloud.error_reporting scope: "http://example.com/scope",
                                         timeout: 60
        _(project).must_equal "error_reporting-project-object"
      end
    end
  end

  describe '.error_reporting' do
    it "calls out to Google::Cloud::ErrorReporting.new" do
      gcloud = Google::Cloud.new
      stubbed_new =
        ->(project_id: nil, credentials: nil, scope: nil, timeout: nil) {
          _(project_id).must_be_nil
          _(credentials).must_be_nil
          _(scope).must_be :nil?
          _(timeout).must_be :nil?
          "fake-error_reporting-project-object"
        }
      Google::Cloud::ErrorReporting.stub :new, stubbed_new do
        project = gcloud.error_reporting
        _(project).must_equal "fake-error_reporting-project-object"
      end
    end

    it "passes project and keyfile to Google::Cloud::ErrorReporting.new" do
      gcloud = Google::Cloud.new "test-project-id", "/path/to/a/keyfile"
      stubbed_new =
        ->(project_id: nil, credentials: nil, scope: nil, timeout: nil) {
          _(project_id).must_equal "test-project-id"
          _(credentials).must_equal "/path/to/a/keyfile"
          _(scope).must_be :nil?
          _(timeout).must_be :nil?
          "error_reporting-project-object"
        }
      Google::Cloud::ErrorReporting.stub :new, stubbed_new do
        project = gcloud.error_reporting
        _(project).must_equal "error_reporting-project-object"
      end
    end

    it "passes project and keyfile and options to Google::Cloud::ErrorReporting.new" do
      gcloud = Google::Cloud.new "test-project-id", "/path/to/a/keyfile"
      stubbed_new =
        ->(project_id: nil, credentials: nil, scope: nil, timeout: nil) {
          _(project_id).must_equal "test-project-id"
          _(credentials).must_equal "/path/to/a/keyfile"
          _(scope).must_equal "http://example.com/scope"
          _(timeout).must_equal 60
          "error_reporting-project-object"
        }
      Google::Cloud::ErrorReporting.stub :new, stubbed_new do
        project = gcloud.error_reporting scope: "http://example.com/scope",
                                         timeout: 60
        _(project).must_equal "error_reporting-project-object"
      end
    end
  end
end
