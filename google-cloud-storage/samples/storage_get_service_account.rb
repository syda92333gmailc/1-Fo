# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START storage_get_service_account]
def get_service_account
  require "google/cloud/storage"

  storage = Google::Cloud::Storage.new
  email = storage.service_account_email

  puts "The GCS service account for project #{storage.project_id} is: #{email}"
end
# [END storage_get_service_account]

get_service_account if $PROGRAM_NAME == __FILE__
