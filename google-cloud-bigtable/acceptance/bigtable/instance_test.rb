# frozen_string_literal: true

# Copyright 2018 Google LLC
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


require "bigtable_helper"

describe "Instances", :bigtable do
  it "lists and get a instance" do
    instances = bigtable.instances.all.to_a
    _(instances).wont_be :empty?
    instances.each do |instance|
      _(instance).must_be_kind_of Google::Cloud::Bigtable::Instance
    end

    instance_id = instances.first.instance_id

    first_instance = bigtable.instance(instance_id)
    _(first_instance).must_be_kind_of Google::Cloud::Bigtable::Instance
  end

  it "update instance labels and display name" do
    time = Time.now.to_i.to_s
    display_name = "Ruby Acceptance Test Update"

    instance = bigtable.instance(bigtable_instance_id)
    instance.display_name = display_name
    instance.labels["updated-at"] = time

    job = instance.save
    job.wait_until_done!

    instance.reload!
    _(instance.display_name).must_equal display_name
    _(instance.labels["updated-at"]).must_equal time
  end

  describe "IAM policies and permissions" do
    let(:service_account) { bigtable.service.credentials.client.issuer }

    it "tests permissions" do
      instance = bigtable_instance

      roles = ["bigtable.instances.get", "bigtable.tables.get"]
      permissions = instance.test_iam_permissions(roles)
      _(permissions).must_be_kind_of Array
      _(permissions).must_equal roles
    end

    it "allows policy to be updated on an instance" do
      instance = bigtable_instance
      _(instance.policy).must_be_kind_of Google::Cloud::Bigtable::Policy

      _(service_account).wont_be :nil?

      role = "roles/bigtable.user"
      member = "serviceAccount:#{service_account}"

      policy = instance.policy
      policy.add(role, member)
      updated_policy = instance.update_policy(policy)

      _(updated_policy.role(role)).wont_be :nil?

      role_member = instance.policy.role(role).select { |m| m == member }
      _(role_member.size).must_equal 1
    end
  end
end
