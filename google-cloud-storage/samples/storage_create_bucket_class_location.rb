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

# [START storage_create_bucket_class_location]
def create_bucket_class_location bucket_name:
  # The ID to give your GCS bucket
  # bucket_name = "your-unique-bucket-name"

  require "google/cloud/storage"

  storage = Google::Cloud::Storage.new
  bucket  = storage.create_bucket bucket_name,
                                  location:      "ASIA",
                                  storage_class: "COLDLINE"

  puts "Created bucket #{bucket.name} in #{bucket.location} with #{bucket.storage_class} class"
end
# [END storage_create_bucket_class_location]

if $PROGRAM_NAME == __FILE__
  create_bucket_class_location bucket_name: ARGV.shift
end
