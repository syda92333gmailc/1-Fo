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


require "google/cloud/firestore/v1/firestore/credentials"

module Google
  module Cloud
    module Firestore
      ##
      # # Credentials
      #
      # Represents the authentication and authorization used to connect to the
      # Firestore service.
      #
      # @example
      #   require "google/cloud/firestore"
      #
      #   keyfile = "/path/to/keyfile.json"
      #   creds = Google::Cloud::Firestore::Credentials.new keyfile
      #
      #   firestore = Google::Cloud::Firestore.new(
      #     project_id: "my-project",
      #     credentials: creds
      #   )
      #
      #   firestore.project_id #=> "my-project"
      #
      class Credentials < Google::Cloud::Firestore::V1::Firestore::Credentials
      end
    end
  end
end
