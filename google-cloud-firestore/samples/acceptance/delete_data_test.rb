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

require_relative "helper"
require_relative "../delete_data"
require_relative "../get_data"

describe "Google Cloud Firestore API samples - Delete Data" do
  before do
    @firestore_project = ENV["FIRESTORE_PROJECT"]
    @collection_path = random_name "cities"
    capture_io do
      retrieve_create_examples project_id: @firestore_project, collection_path: @collection_path
    end
  end

  it "delete_field, delete_doc, delete_collection" do
    out, _err = capture_io do
      delete_field project_id: @firestore_project, collection_path: @collection_path
    end
    assert_includes out, "Deleted the capital field from the BJ document in the cities collection."

    out, _err = capture_io do
      delete_doc project_id: @firestore_project, collection_path: @collection_path
    end
    assert_includes out, "Deleted the DC document in the cities collection."

    out, _err = capture_io do
      delete_collection project_id: @firestore_project, collection_path: @collection_path
    end
    assert_includes out, "Deleting document SF"
    assert_includes out, "Deleting document LA"
    assert_includes out, "Deleting document TOK"
    assert_includes out, "Deleting document BJ"
    assert_includes out, "Finished deleting all documents from the collection."
  end
end
