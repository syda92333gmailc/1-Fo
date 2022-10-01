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

describe Google::Cloud::Firestore::Convert, :value_to_raw, :mock_firestore do
  # These tests are a sanity check on the implementation of the conversion methods.
  # These tests are testing private methods and this is generally not a great idea.
  # But these conversions are so important that it was decided to do it anyway.

  it "converts a true boolean value" do
    value = Google::Cloud::Firestore::V1::Value.new(null_value: :NULL_VALUE)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_be :nil?
  end

  it "converts a true boolean value" do
    value = Google::Cloud::Firestore::V1::Value.new(boolean_value: true)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal true
  end

  it "converts a false boolean value" do
    value = Google::Cloud::Firestore::V1::Value.new(boolean_value: false)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal false
  end

  it "converts a integer value" do
    value = Google::Cloud::Firestore::V1::Value.new(integer_value: 29)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal 29
  end

  it "converts a double value" do
    value = Google::Cloud::Firestore::V1::Value.new(double_value: 0.9)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal 0.9
  end

  it "converts a nan value" do
    value = Google::Cloud::Firestore::V1::Value.new(double_value: Float::NAN)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_be :nan?
  end

  it "converts an infinity value" do
    value = Google::Cloud::Firestore::V1::Value.new(double_value: Float::INFINITY)

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal Float::INFINITY
  end

  it "converts a timestamp value" do
    value = Google::Cloud::Firestore::V1::Value.new(timestamp_value: Google::Protobuf::Timestamp.new(seconds: 1483326245, nanos: 60000000))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal Time.parse("2017-01-02 03:04:05.06 UTC")
  end

  it "converts a string value" do
    value = Google::Cloud::Firestore::V1::Value.new(string_value: "Alice")

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal "Alice"
  end

  it "converts a bytes value" do
    value = Google::Cloud::Firestore::V1::Value.new(bytes_value: "c\0ntents")

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_be_kind_of StringIO
    _(raw.read).must_equal "c\0ntents"
  end

  it "converts a reference value" do
    value = Google::Cloud::Firestore::V1::Value.new(reference_value: "projects/#{project}/databases/(default)/documents/users/alice" )

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_be_kind_of Google::Cloud::Firestore::DocumentReference
    _(raw.document_id).must_equal "alice"
    _(raw.document_path).must_equal "users/alice"
  end

  it "converts a geo_point value" do
    value = Google::Cloud::Firestore::V1::Value.new(geo_point_value: Google::Type::LatLng.new(latitude: 43.878264, longitude: -103.45700740814209))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_be_kind_of Hash
    _(raw[:longitude]).must_equal -103.45700740814209
    _(raw[:latitude]).must_equal 43.878264
  end

  it "converts an array of integer values" do
    value = Google::Cloud::Firestore::V1::Value.new(array_value: Google::Cloud::Firestore::V1::ArrayValue.new(values: [Google::Cloud::Firestore::V1::Value.new(integer_value: 1), Google::Cloud::Firestore::V1::Value.new(integer_value: 2), Google::Cloud::Firestore::V1::Value.new(integer_value: 3)]))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal [1, 2, 3]
  end

  it "converts an array of string values" do
    value = Google::Cloud::Firestore::V1::Value.new(array_value: Google::Cloud::Firestore::V1::ArrayValue.new(values: [Google::Cloud::Firestore::V1::Value.new(string_value: "foo"), Google::Cloud::Firestore::V1::Value.new(string_value: "bar"), Google::Cloud::Firestore::V1::Value.new(string_value: "baz")]))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal %w(foo bar baz)
  end

  it "converts a simple hash value" do
    value = Google::Cloud::Firestore::V1::Value.new(map_value: Google::Cloud::Firestore::V1::MapValue.new(fields: {"foo"=>Google::Cloud::Firestore::V1::Value.new(string_value: "bar")}))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal({ foo: "bar" })
  end

  it "converts a complex hash value" do
    value = Google::Cloud::Firestore::V1::Value.new(map_value: Google::Cloud::Firestore::V1::MapValue.new(fields: { "score"=>Google::Cloud::Firestore::V1::Value.new(double_value: 0.9), "env"=>Google::Cloud::Firestore::V1::Value.new(string_value: "production"), "project_ids"=>Google::Cloud::Firestore::V1::Value.new(array_value: Google::Cloud::Firestore::V1::ArrayValue.new(values: [Google::Cloud::Firestore::V1::Value.new(integer_value: 1), Google::Cloud::Firestore::V1::Value.new(integer_value: 2), Google::Cloud::Firestore::V1::Value.new(integer_value: 3)] )) }))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal({ env: "production", score: 0.9, project_ids: [1, 2, 3] })
  end

  it "converts an emtpy hash value" do
    value = Google::Cloud::Firestore::V1::Value.new(map_value: Google::Cloud::Firestore::V1::MapValue.new(fields: {}))

    raw = Google::Cloud::Firestore::Convert.value_to_raw value, firestore
    _(raw).must_equal({})
  end
end
