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

describe "Instance AppProfiles", :bigtable do
  let(:instance) {  bigtable_instance }

  it "list app profiles and get app profile" do
    app_profile_id = "default"

    app_profiles = instance.app_profiles.to_a
    _(app_profiles).wont_be :empty?
    app_profiles.each do |profile|
      _(profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
    end

    app_profile = instance.app_profile(app_profile_id)
    _(app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
  end

  it "create multi cluster routing app profile and delete" do
    app_profile_id = "multi-cluster-#{Time.now.to_i}"
    routing_policy = Google::Cloud::Bigtable::AppProfile.multi_cluster_routing
    _(routing_policy).must_be_instance_of Google::Cloud::Bigtable::MultiClusterRoutingUseAny

    app_profile = instance.create_app_profile(
      app_profile_id,
      routing_policy,
      description: "App profile test multi cluster routing",
      ignore_warnings: true
    )

    _(app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
    _(app_profile.single_cluster_routing).must_be :nil?
    _(app_profile.multi_cluster_routing).must_be_instance_of Google::Cloud::Bigtable::MultiClusterRoutingUseAny

    app_profile = instance.app_profile(app_profile_id)
    _(app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
    app_profile.delete(ignore_warnings: true)

    _(instance.app_profile(app_profile_id)).must_be :nil?
  end

  it "create single cluster routing app profile and delete" do
    app_profile_id = "single-cluster-#{Time.now.to_i}"
    routing_policy = Google::Cloud::Bigtable::AppProfile.single_cluster_routing(
      bigtable_cluster_id,
      allow_transactional_writes: true
    )
    _(routing_policy).must_be_instance_of Google::Cloud::Bigtable::SingleClusterRouting
    _(routing_policy.cluster_id).must_equal bigtable_cluster_id
    _(routing_policy.allow_transactional_writes).must_equal true

    app_profile = instance.create_app_profile(
      app_profile_id,
      routing_policy,
      description: "App profile test single cluster routing",
      ignore_warnings: true
    )
    _(app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
    _(app_profile.multi_cluster_routing).must_be :nil?
    _(app_profile.single_cluster_routing).must_be_instance_of Google::Cloud::Bigtable::SingleClusterRouting
    _(app_profile.single_cluster_routing.cluster_id).must_equal bigtable_cluster_id
    _(app_profile.single_cluster_routing.allow_transactional_writes).must_equal true

    app_profile = instance.app_profile(app_profile_id)
    _(app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
    app_profile.delete(ignore_warnings: true)

    _(instance.app_profile(app_profile_id)).must_be :nil?
  end

  it "update app profile routing policy" do
    app_profile_id = "single-cluster-#{Time.now.to_i}"
    routing_policy = Google::Cloud::Bigtable::AppProfile.single_cluster_routing(
      bigtable_cluster_id,
      allow_transactional_writes: true
    )

    app_profile = instance.create_app_profile(
      app_profile_id,
      routing_policy,
      description: "App profile test single cluster routing",
      ignore_warnings: true
    )
    _(app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile
    _(app_profile.multi_cluster_routing).must_be :nil?
    _(app_profile.single_cluster_routing).must_be_instance_of Google::Cloud::Bigtable::SingleClusterRouting

    app_profile.routing_policy = Google::Cloud::Bigtable::AppProfile.multi_cluster_routing
    job = app_profile.save(ignore_warnings: true)
    job.wait_until_done!
    _(job.app_profile).must_be_kind_of Google::Cloud::Bigtable::AppProfile

    app_profile.reload!
    _(app_profile.single_cluster_routing).must_be :nil?
    _(app_profile.multi_cluster_routing).must_be_instance_of Google::Cloud::Bigtable::MultiClusterRoutingUseAny

    app_profile.delete(ignore_warnings: true)
    _(instance.app_profile(app_profile_id)).must_be :nil?
  end
end
