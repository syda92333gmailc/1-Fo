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

require "spanner_helper"

describe "Spanner Client", :types, :int64, :spanner do
  let(:db) { spanner_client }
  let(:table_name) { "stuffs" }

  it "writes and reads int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, int: 9999 }
    results = db.read table_name, [:id, :int], keys: id

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, int: :INT64 })
    _(results.rows.first.to_h).must_equal({ id: id, int: 9999 })
  end

  it "writes and queries int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, int: 9999 }
    results = db.execute_query "SELECT id, int FROM #{table_name} WHERE id = @id", params: { id: id }

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, int: :INT64 })
    _(results.rows.first.to_h).must_equal({ id: id, int: 9999 })
  end

  it "writes and reads NULL int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, int: nil }
    results = db.read table_name, [:id, :int], keys: id

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, int: :INT64 })
    _(results.rows.first.to_h).must_equal({ id: id, int: nil })
  end

  it "writes and queries NULL int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, int: nil }
    results = db.execute_query "SELECT id, int FROM #{table_name} WHERE id = @id", params: { id: id }

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, int: :INT64 })
    _(results.rows.first.to_h).must_equal({ id: id, int: nil })
  end

  it "writes and reads array of int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: [9997, 9998, 9999] }
    results = db.read table_name, [:id, :ints], keys: id

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: [9997, 9998, 9999] })
  end

  it "writes and queries array of int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: [9997, 9998, 9999] }
    results = db.execute_query "SELECT id, ints FROM #{table_name} WHERE id = @id", params: { id: id }

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: [9997, 9998, 9999] })
  end

  it "writes and reads array of int64 with NULL" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: [nil, 9997, 9998, 9999] }
    results = db.read table_name, [:id, :ints], keys: id

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: [nil, 9997, 9998, 9999] })
  end

  it "writes and queries array of int64 with NULL" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: [nil, 9997, 9998, 9999] }
    results = db.execute_query "SELECT id, ints FROM #{table_name} WHERE id = @id", params: { id: id }

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: [nil, 9997, 9998, 9999] })
  end

  it "writes and reads empty array of int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: [] }
    results = db.read table_name, [:id, :ints], keys: id

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: [] })
  end

  it "writes and queries empty array of int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: [] }
    results = db.execute_query "SELECT id, ints FROM #{table_name} WHERE id = @id", params: { id: id }

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: [] })
  end

  it "writes and reads NULL array of int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: nil }
    results = db.read table_name, [:id, :ints], keys: id

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: nil })
  end

  it "writes and queries NULL array of int64" do
    id = SecureRandom.int64
    db.upsert table_name, { id: id, ints: nil }
    results = db.execute_query "SELECT id, ints FROM #{table_name} WHERE id = @id", params: { id: id }

    _(results).must_be_kind_of Google::Cloud::Spanner::Results
    _(results.fields.to_h).must_equal({ id: :INT64, ints: [:INT64] })
    _(results.rows.first.to_h).must_equal({ id: id, ints: nil })
  end
end
