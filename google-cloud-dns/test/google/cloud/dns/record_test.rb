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

describe Google::Cloud::Dns::Record, :mock_dns do
  # Create a record object with the project's mocked connection object
  let(:record_name) { "example.com." }
  let(:record_type) { "NS" }
  let(:record_ttl)  { 86400 }
  let(:record_data) { ["ns-cloud-b1.googledomains.com.","ns-cloud-b2.googledomains.com."] }
  let(:record_gapi) { random_record_gapi record_name, record_type, record_ttl, record_data }
  let(:record) { Google::Cloud::Dns::Record.from_gapi record_gapi }

  it "knows its attributes" do
    _(record.name).must_equal record_name
    _(record.type).must_equal record_type
    _(record.ttl).must_equal  record_ttl
    _(record.data).must_equal record_data
  end

  it "exports to zonefile record string" do
    zonefile_records = record.to_zonefile_records
    _(zonefile_records.count).must_equal 2
    _(zonefile_records.first).must_equal "#{record_name} #{record_ttl} IN #{record_type} #{record_data.first}"
    _(zonefile_records.last).must_equal "#{record_name} #{record_ttl} IN #{record_type} #{record_data.last}"
  end

  it "knows if it is equal to other records" do
    dupe = record.dup
    _(dupe).must_equal record
    dupe.data = ["5.6.7.8"]
    _(dupe).wont_equal record
  end

  it "duplicates all its data deeply" do
    dupe = record.dup
    _(dupe).must_equal record
    _(dupe.data).must_equal record.data
    _(dupe.data[0]).must_equal record.data[0]

    dupe.data[0] = "5.6.7.8"

    _(dupe).wont_equal record
    _(dupe.data).wont_equal record.data
    _(dupe.data[0]).wont_equal record.data[0]
  end

  it "duplicates its data array" do
    dupe = record.dup
    _(dupe).must_equal record
    _(dupe.data).must_equal record.data
    _(dupe.data.count).must_equal record.data.count

    dupe.data << "ns-cloud-b3.googledomains.com."

    _(dupe).wont_equal record
    _(dupe.data).wont_equal record.data
    _(dupe.data.count).wont_equal record.data.count
  end

  it "duplicates its data array elements" do
    dupe = record.dup
    _(dupe).must_equal record
    _(dupe.data).must_equal record.data
    _(dupe.data[0]).must_equal record.data[0]

    dupe.data[0].gsub! "com", "net"

    _(dupe).wont_equal record
    _(dupe.data).wont_equal record.data
    _(dupe.data[0]).wont_equal record.data[0]
  end

  it "is comparable in arrays" do
    original = [ Google::Cloud::Dns::Record.new("example.com.", "A", 86400, "localhost"),
                 Google::Cloud::Dns::Record.new("example.net.", "A", 86400, "localhost"),
                 Google::Cloud::Dns::Record.new("example.org.", "A", 86400, "localhost") ]
    changed = original.map(&:dup)
    _(changed).must_equal original
    changed.first.ttl = 18600
    _(changed).wont_equal original

    existing = original - changed
    updated = changed - original
    _(existing.count).must_equal 1
    _(updated.count).must_equal 1
    _(existing.first).must_equal original.first
    _(updated.first).must_equal changed.first
  end
end
