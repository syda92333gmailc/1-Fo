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

describe Google::Cloud::ResourceManager::Policy do
  let(:etag)       { "etag-1" }
  let(:roles) { { "roles/viewer" => ["allUsers"] } }
  let(:policy)    { Google::Cloud::ResourceManager::Policy.new etag, roles }

  it "knows its etag" do
    _(policy.etag).must_equal etag
  end

  it "knows its roles" do
    _(policy.roles.keys.sort).must_equal   roles.keys.sort
    _(policy.roles.values.sort).must_equal roles.values.sort
  end

  it "returns an empty array for missing role" do
    role = policy.role "roles/does-not-exist"
    _(role).must_be_kind_of Array
    _(role).must_be :empty?
    _(role.frozen?).must_equal false
  end

  describe :to_gapi do
    it "creates a Google::Apis::CloudresourcemanagerV1::Policy object with the equivalent de-duped roles" do
      # Add a duplicate entry.
      existing_role, existing_members = policy.roles.first
      policy.add(existing_role, existing_members.first)

      gapi_policy = policy.to_gapi

      _(gapi_policy.class).must_equal  Google::Apis::CloudresourcemanagerV1::Policy
      _(gapi_policy.bindings.size).must_equal policy.roles.size
      gapi_policy.bindings.each do |binding|
        _(binding.members.sort).must_equal policy.roles[binding.role].uniq.sort
      end
    end
  end

  describe :from_gapi do
    it "creates from a typical Google::Apis::CloudresourcemanagerV1::Policy object" do
      gapi = Google::Apis::CloudresourcemanagerV1::Policy.new(
        etag: etag,
        bindings: roles.map do |key, val|
          Google::Apis::CloudresourcemanagerV1::Binding.new(
            role: key,
            members: val
          )
        end
      )

      policy = Google::Cloud::ResourceManager::Policy.from_gapi gapi

      _(policy).must_be_kind_of Google::Cloud::ResourceManager::Policy
      _(policy.etag).must_equal etag
      _(policy.roles.keys.sort).must_equal   roles.keys.sort
      _(policy.roles.values.sort).must_equal roles.values.sort
    end

    it "creates from an empty Google::Apis::CloudresourcemanagerV1::Policy object" do
      gapi = Google::Apis::CloudresourcemanagerV1::Policy.new

      policy = Google::Cloud::ResourceManager::Policy.from_gapi gapi

      _(policy).must_be_kind_of Google::Cloud::ResourceManager::Policy
      _(policy.etag).must_be :nil?
      _(policy.roles).must_be :empty?
    end
  end
end
