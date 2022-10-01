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

describe Google::Cloud::Spanner::BatchSnapshot, :metadata, :mock_spanner do
  let(:instance_id) { "my-instance-id" }
  let(:database_id) { "my-database-id" }
  let(:session_id) { "session123" }
  let(:session_grpc) { Google::Cloud::Spanner::V1::Session.new name: session_path(instance_id, database_id, session_id) }
  let(:session) { Google::Cloud::Spanner::Session.from_grpc session_grpc, spanner.service }
  let(:transaction_id) { "tx789" }
  let(:time_obj) { Time.parse "2014-10-02T15:01:23.045123456Z" }
  let(:timestamp) { Google::Cloud::Spanner::Convert.time_to_timestamp time_obj }
  let(:transaction_grpc) { Google::Cloud::Spanner::V1::Transaction.new id: transaction_id, read_timestamp: timestamp }
  let(:batch_snapshot) { Google::Cloud::Spanner::BatchSnapshot.from_grpc transaction_grpc, session }

  it "knows it has a transaction_id" do
    _(batch_snapshot).must_be_kind_of Google::Cloud::Spanner::BatchSnapshot

    _(batch_snapshot.transaction_id).must_equal transaction_id
  end

  it "knows it has a timestamp" do
    _(batch_snapshot).must_be_kind_of Google::Cloud::Spanner::BatchSnapshot

    _(batch_snapshot.timestamp).must_equal time_obj
  end
end
