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


require "helper"

describe Google::Cloud::Bigtable::ValueRange, :value_range, :mock_bigtable do
  let(:integer_encoded) { "\x00\x00\x00\x00\x00\x00\x00\x01".encode "ASCII-8BIT" }

  it "create inclusive from range instance" do
    from_value = "from-value-inclusive"
    range = Google::Cloud::Bigtable::ValueRange.new.from(from_value)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.start_value_closed).must_equal from_value
  end

  it "create inclusive from range instance with integer" do
    range = Google::Cloud::Bigtable::ValueRange.new.from(1)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.start_value_closed).must_equal integer_encoded
  end

  it "create exclusive from range instance" do
    from_value = "from-value-exclusive"
    range = Google::Cloud::Bigtable::ValueRange.new.from(from_value, inclusive: false)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.start_value_open).must_equal from_value
  end

  it "create exclusive to range instance" do
    to_value = "to-value-inclusive"
    range =Google::Cloud::Bigtable::ValueRange.new.to(to_value)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.end_value_open).must_equal to_value
  end

  it "create exclusive to range instance with integer" do
    range =Google::Cloud::Bigtable::ValueRange.new.to(1)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.end_value_open).must_equal integer_encoded
  end

  it "create inclusive to range instance" do
    to_value = "to-value-exclusive"
    range =Google::Cloud::Bigtable::ValueRange.new.to(to_value, inclusive: true)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.end_value_closed).must_equal to_value
  end

  it "create instance using 'between'" do
    from_value = "from-value"
    to_value = "to-value"
    range = Google::Cloud::Bigtable::ValueRange.new.between(from_value, to_value)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.start_value_closed).must_equal from_value
    _(grpc.end_value_closed).must_equal to_value
  end

  it "create instance using 'of'" do
    from_value = "from-value"
    to_value = "to-value"
    range = Google::Cloud::Bigtable::ValueRange.new.of(from_value, to_value)

    _(range).must_be_kind_of Google::Cloud::Bigtable::ValueRange

    grpc = range.to_grpc
    _(grpc).must_be_kind_of Google::Cloud::Bigtable::V2::ValueRange
    _(grpc.start_value_closed).must_equal from_value
    _(grpc.end_value_open).must_equal to_value
  end
end
