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

# [START storage_set_retention_policy]
def set_retention_policy bucket_name:, retention_period:
  # The ID of your GCS bucket
  # bucket_name = "your-unique-bucket-name"

  # The retention period for objects in bucket
  # retention_period = 3600 # 1 hour in seconds

  require "google/cloud/storage"

  storage = Google::Cloud::Storage.new
  bucket  = storage.bucket bucket_name

  bucket.retention_period = retention_period

  puts "Retention period for #{bucket_name} is now #{bucket.retention_period} seconds."
end
# [END storage_set_retention_policy]

set_retention_policy bucket_name: ARGV.shift, retention_period: ARGV.shift if $PROGRAM_NAME == __FILE__
