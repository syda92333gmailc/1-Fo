# Copyright 2017 Google LLC
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
# require "datetime"

describe Google::Cloud::Spanner::Convert, :timestamp, :mock_spanner do
  # This tests is a sanity check on the implementation of the conversion method.
  # We are testing the private method. This functionality is also covered elsewhere,
  # but it was thought that since this conversion is so important we might as well
  # also test it apart from the other tests.

  it "converts a Time to a Timestamp" do
    time = Time.parse "2014-10-02T15:01:23.045123456Z"
    timestamp = Google::Cloud::Spanner::Convert.time_to_timestamp time
    _(timestamp).must_be_kind_of Google::Protobuf::Timestamp
    _(timestamp.seconds).must_equal 1412262083
    _(timestamp.nanos).must_equal 45123456
  end

  it "converts a DateTime to a Timestamp" do
    datetime = DateTime.parse "2014-10-02T15:01:23.045123456Z"
    timestamp = Google::Cloud::Spanner::Convert.time_to_timestamp datetime
    _(timestamp).must_be_kind_of Google::Protobuf::Timestamp
    _(timestamp.seconds).must_equal 1412262083
    _(timestamp.nanos).must_equal 45123456
  end

  it "converts an empty Time to an empty Timestamp" do
    time = nil
    timestamp = Google::Cloud::Spanner::Convert.time_to_timestamp time
    _(timestamp).must_be :nil?
  end

  it "converts a Timestamp to a Time" do
    timestamp = Google::Protobuf::Timestamp.new seconds: 1412262083, nanos: 45123456
    time = Google::Cloud::Spanner::Convert.timestamp_to_time timestamp
    _(time).must_be_kind_of Time
    _(time).must_equal Time.parse("2014-10-02T15:01:23.045123456Z")
  end

  it "converts an empty Timestamp to an empty Time" do
    timestamp = nil
    time = Google::Cloud::Spanner::Convert.timestamp_to_time timestamp
    _(time).must_be :nil?
  end
end
