# Copyright 2015 Google LLC
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

describe Google::Cloud::Dns::Change, :mock_dns do
  let(:zone_name) { "example-zone" }
  let(:zone_dns) { "example.com." }
  let(:zone_gapi) { random_zone_gapi zone_name, zone_dns }
  let(:zone) { Google::Cloud::Dns::Zone.from_gapi zone_gapi, dns.service }
  let(:change) { Google::Cloud::Dns::Change.from_gapi done_change_gapi, zone }

  it "knows its attributes" do
    _(change.id).must_equal "dns-change-1234567890"
    _(change.additions.count).must_equal 1
    _(change.additions.first).must_be_kind_of Google::Cloud::Dns::Record
    _(change.deletions.count).must_equal 1
    _(change.deletions.first).must_be_kind_of Google::Cloud::Dns::Record
    _(change.status).must_equal "done"
    _(change).must_be :done?
    _(change).wont_be :pending?

    start_time = Time.new 2015, 1, 1, 0, 0, 0, 0
    _(change.started_at).must_equal start_time
  end

  it "can represent a pending change" do
    pending_change = Google::Cloud::Dns::Change.from_gapi pending_change_gapi, zone

    _(pending_change.id).must_equal "dns-change-1234567890"
    _(pending_change.additions.count).must_equal 1
    _(pending_change.additions.first).must_be_kind_of Google::Cloud::Dns::Record
    _(pending_change.deletions.count).must_equal 1
    _(pending_change.deletions.first).must_be_kind_of Google::Cloud::Dns::Record
    _(pending_change.status).must_equal "pending"
    _(pending_change).wont_be :done?
    _(pending_change).must_be :pending?

    start_time = Time.new 2015, 1, 1, 0, 0, 0, 0
    _(pending_change.started_at).must_equal start_time
  end

  it "can reload itself" do
    mock = Minitest::Mock.new
    mock.expect :get_change, pending_change_gapi(change.id), [project, zone.id, change.id]
    mock.expect :get_change, done_change_gapi(change.id), [project, zone.id, change.id]

    dns.service.mocked_service = mock
    _(change).must_be :done?
    change.reload!
    _(change).must_be :pending?
    change.reload!
    mock.verify

    _(change).must_be :done?
  end

  it "can reload itself with refresh alias" do
    mock = Minitest::Mock.new
    mock.expect :get_change, pending_change_gapi(change.id), [project, zone.id, change.id]
    mock.expect :get_change, done_change_gapi(change.id), [project, zone.id, change.id]

    dns.service.mocked_service = mock
    _(change).must_be :done?
    change.refresh!
    _(change).must_be :pending?
    change.refresh!
    mock.verify

    _(change).must_be :done?
  end

  it "can wait until done" do
    pending_change = Google::Cloud::Dns::Change.from_gapi pending_change_gapi, zone
    mock = Minitest::Mock.new
    mock.expect :get_change, pending_change_gapi(pending_change.id), [project, zone.id, change.id]
    mock.expect :get_change, pending_change_gapi(pending_change.id), [project, zone.id, change.id]
    mock.expect :get_change, pending_change_gapi(pending_change.id), [project, zone.id, change.id]
    mock.expect :get_change, pending_change_gapi(pending_change.id), [project, zone.id, change.id]
    mock.expect :get_change, pending_change_gapi(pending_change.id), [project, zone.id, change.id]
    mock.expect :get_change, done_change_gapi(pending_change.id), [project, zone.id, change.id]

    dns.service.mocked_service = mock
    # mock out the sleep method so the test doesn't actually block
    def pending_change.sleep *args
    end

    dns.service.mocked_service = mock
    _(pending_change).must_be :pending?
    pending_change.wait_until_done!
    mock.verify

    _(pending_change).must_be :done?
  end
end
