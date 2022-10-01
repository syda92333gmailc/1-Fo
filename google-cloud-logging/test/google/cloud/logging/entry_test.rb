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

describe Google::Cloud::Logging::Entry, :mock_logging do
  let(:entry_hash) { random_entry_hash }
  let(:entry_grpc) { Google::Cloud::Logging::V2::LogEntry.new entry_hash }
  let(:entry) { Google::Cloud::Logging::Entry.from_grpc entry_grpc }

  it "knows its attributes" do
    _(entry.log_name).must_equal             entry_hash[:log_name]
    _(entry.resource).must_be_kind_of        Google::Cloud::Logging::Resource
    _(entry.timestamp.to_i).must_equal       Time.parse("2014-10-02T15:01:23.045123456Z").to_i
    _(entry.severity).must_equal             entry_hash[:severity]
    _(entry.insert_id).must_equal            entry_hash[:insert_id]
    _(entry.labels).must_be_kind_of          Hash
    _(entry.labels["env"]).must_equal        "production"
    _(entry.labels["foo"]).must_equal        "bar"
    _(entry.payload).must_equal              "payload"
    _(entry.http_request).must_be_kind_of    Google::Cloud::Logging::Entry::HttpRequest
    _(entry.operation).must_be_kind_of       Google::Cloud::Logging::Entry::Operation
    _(entry.trace).must_equal                "projects/my-projectid/traces/06796866738c859f2f19b7cfb3214824"
    _(entry.source_location).must_be_kind_of       Google::Cloud::Logging::Entry::SourceLocation
    _(entry.trace_sampled).must_equal        true
  end

  it "timestamp gives the correct time when a timestamp is present" do
    custom_timestamp = Time.parse "2014-10-02T15:01:23.045123456Z"
    entry_grpc.timestamp.seconds = custom_timestamp.to_i
    entry_grpc.timestamp.nanos = custom_timestamp.nsec
    entry = Google::Cloud::Logging::Entry.from_grpc entry_grpc
    _(entry.timestamp).wont_be :nil?
    _(entry.timestamp).must_equal custom_timestamp
  end

  it "timestamp returns nil when not present" do
    entry_hash[:timestamp] = nil
    _(entry.timestamp).must_be :nil?
  end

  it "timestamp gives nil when no timestamp is present" do
    entry.timestamp = nil
    _(entry.timestamp).must_be :nil?
  end

  it "labels will return a Hash even when missing from the Google API object" do
    entry_hash[:labels] = nil
    _(entry.labels).must_be_kind_of Hash
    _(entry.labels).must_be :empty?
  end

  it "can have a JSON payload" do
    entry.payload = { "pay" => "load" }
    _(entry.payload).must_be_kind_of Hash
    _(entry.payload["pay"]).must_equal "load"
  end

  it "can have a ProtoBuf payload" do
    proto = Google::Protobuf::Any.new type_url: "example.com/Greeter/SayHello",
                                      value: "\n\fHello world!".encode("ASCII-8BIT")
    entry.payload = proto
    _(entry.payload).must_be_kind_of Google::Protobuf::Any
    grpc = entry.to_grpc
    _(grpc.proto_payload).must_be_kind_of Google::Protobuf::Any
    _(grpc.proto_payload).must_equal          proto
    _(grpc.proto_payload.type_url).must_equal proto.type_url
    _(grpc.proto_payload.value).must_equal    proto.value
  end

  it "has the correct resource attributes" do
    _(entry.resource.type).must_equal entry_hash[:resource][:type]
    _(entry.resource.labels.keys.sort).must_equal   entry_hash[:resource][:labels].keys.sort
    _(entry.resource.labels.values.sort).must_equal entry_hash[:resource][:labels].values.sort
  end

  it "has a resource even if the Google API object doesn't have it" do
    entry_hash.delete :resource

    _(entry.resource).wont_be :nil?
    _(entry.resource).must_be_kind_of Google::Cloud::Logging::Resource
    _(entry.resource.type).must_be :nil?
    _(entry.resource.labels).must_be_kind_of Hash
    _(entry.resource.labels).must_be :empty?
  end

  it "has the correct http_request attributes" do
    _(entry.http_request.request_method).must_equal "GET"
    _(entry.http_request.url).must_equal "http://test.local/foo?bar=baz"
    _(entry.http_request.size).must_equal 123
    _(entry.http_request.status).must_equal 200
    _(entry.http_request.response_size).must_equal 456
    _(entry.http_request.user_agent).must_equal "google-cloud/1.0.0"
    _(entry.http_request.remote_ip).must_equal "127.0.0.1"
    _(entry.http_request.referer).must_equal "http://test.local/referer"
    _(entry.http_request.cache_hit).must_equal false
    _(entry.http_request.validated).must_equal false
  end

  it "has an http_request even if the Google API object doesn't have it" do
    entry_hash.delete :http_request

    _(entry.http_request).wont_be :nil?
    _(entry.http_request).must_be_kind_of Google::Cloud::Logging::Entry::HttpRequest
    _(entry.http_request.request_method).must_be :nil?
    _(entry.http_request.url).must_be :nil?
    _(entry.http_request.size).must_be :nil?
    _(entry.http_request.status).must_be :nil?
    _(entry.http_request.response_size).must_be :nil?
    _(entry.http_request.user_agent).must_be :nil?
    _(entry.http_request.remote_ip).must_be :nil?
    _(entry.http_request.referer).must_be :nil?
    _(entry.http_request.cache_hit).must_be :nil?
    _(entry.http_request.validated).must_be :nil?
  end

  it "has the correct operation attributes" do
    _(entry.operation.id).must_equal "xyz789"
    _(entry.operation.producer).must_equal "MyApp.MyClass#my_method"
    _(entry.operation.first).must_equal false
    _(entry.operation.last).must_equal false
  end

  it "has an operation even if the Google API object doesn't have it" do
    entry_hash.delete :operation

    _(entry.operation).wont_be :nil?
    _(entry.operation).must_be_kind_of Google::Cloud::Logging::Entry::Operation
    _(entry.operation.id).must_be :nil?
    _(entry.operation.producer).must_be :nil?
    _(entry.operation.first).must_be :nil?
    _(entry.operation.last).must_be :nil?
  end

  it "has the correct source location attributes" do
    _(entry.source_location.file).must_equal "my_app/my_class.rb"
    _(entry.source_location.line).must_equal 321
    _(entry.source_location.function).must_equal "#my_method"
  end

  it "has a source location even if the Google API object doesn't have it" do
    entry_hash.delete :source_location

    _(entry.source_location).wont_be :nil?
    _(entry.source_location).must_be_kind_of Google::Cloud::Logging::Entry::SourceLocation
    _(entry.source_location.file).must_be :nil?
    _(entry.source_location.line).must_be :nil?
    _(entry.source_location.function).must_be :nil?
  end
end
