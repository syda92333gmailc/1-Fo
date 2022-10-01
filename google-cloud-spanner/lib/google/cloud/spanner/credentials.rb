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


require "google/cloud/spanner/v1/spanner/credentials"

module Google
  module Cloud
    module Spanner
      ##
      # # Credentials
      #
      # Represents the authentication and authorization used to connect to the
      # Spanner API.
      #
      # @example
      #   require "google/cloud/spanner"
      #
      #   keyfile = "/path/to/keyfile.json"
      #   creds = Google::Cloud::Spanner::Credentials.new keyfile
      #
      #   spanner = Google::Cloud::Spanner.new(
      #     project_id: "my-project",
      #     credentials: creds
      #   )
      #
      #   spanner.project_id #=> "my-project"
      #
      class Credentials < Google::Cloud::Spanner::V1::Spanner::Credentials
      end
    end
  end
end
