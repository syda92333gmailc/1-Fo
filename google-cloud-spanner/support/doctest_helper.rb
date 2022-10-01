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

require "minitest/focus"

require "google/cloud/spanner"
require "grpc"
require "grpc/errors"

module Google
  module Cloud
    module Spanner
      def self.stub_new
        define_singleton_method :new do |*args|
          yield *args
        end
      end
      # Create default unmocked methods that will raise if ever called
      def self.new *args
        raise "This code example is not yet mocked"
      end
      class Credentials
        # Override the default constructor
        def self.new *args
          OpenStruct.new(client: OpenStruct.new(updater_proc: Proc.new {}))
        end
      end
    end
  end
end

def mock_spanner
  Google::Cloud::Spanner.stub_new do |*args|
    credentials = OpenStruct.new(client: OpenStruct.new(updater_proc: Proc.new {}))
    spanner = Google::Cloud::Spanner::Project.new(Google::Cloud::Spanner::Service.new("my-project", credentials))

    service = spanner.service
    service.mocked_service = Minitest::Mock.new
    service.mocked_instances = Minitest::Mock.new
    service.mocked_databases = Minitest::Mock.new
    if block_given?
      yield service.mocked_service, service.mocked_instances, service.mocked_databases
    end
    spanner
  end
end

def verify_mock_params actual, expected
  expected.all? do |name, value|
    value === actual[name] || value == actual[value]
  end
end


YARD::Doctest.configure do |doctest|
  # Skip private classes and methods
  doctest.skip "Google::Cloud::Spanner::Session"
  doctest.skip "Google::Cloud::Spanner::Client#fields"
  doctest.skip "Google::Cloud::Spanner::Client#fields_for"
  doctest.skip "Google::Cloud::Spanner::Transaction#fields_for"

  # Skip all aliases, since tests would be exact duplicates
  doctest.skip "Google::Cloud::Spanner::BatchSnapshot#query"
  doctest.skip "Google::Cloud::Spanner::Client#query"
  doctest.skip "Google::Cloud::Spanner::Client#save"
  doctest.skip "Google::Cloud::Spanner::Commit#save"
  doctest.skip "Google::Cloud::Spanner::Fields#new"
  doctest.skip "Google::Cloud::Spanner::Project#project_id"
  doctest.skip "Google::Cloud::Spanner::Snapshot#query"
  doctest.skip "Google::Cloud::Spanner::Transaction#query"
  doctest.skip "Google::Cloud::Spanner::Transaction#save"
  doctest.skip "Google::Cloud::Spanner::Instance::Job#refresh!"
  doctest.skip "Google::Cloud::Spanner::Database::Job#refresh!"
  doctest.skip "Google::Cloud::Spanner::Backup::Job#refresh!"
  doctest.skip "Google::Cloud::Spanner::Backup::Restore::Job#refresh!"
  doctest.skip "Google::Cloud::Spanner::Instance#update"

  doctest.before "Google::Cloud#spanner" do
    mock_spanner do |mock, mock_instances, mock_databases|
      #mock.expect :annotate_text, text_resp, annotate_text_args
    end
  end

  doctest.before "Google::Cloud.spanner" do
    mock_spanner do |mock, mock_instances, mock_databases|
    end
  end

  doctest.before "Google::Cloud::Spanner" do
    mock_spanner do |mock, mock_instances, mock_databases|
    end
  end

  doctest.before "Google::Cloud::Spanner.new" do
    mock_spanner do |mock, mock_instances, mock_databases|
    end
  end

  doctest.skip "Google::Cloud::Spanner::Credentials" # occasionally getting "This code example is not yet mocked"

  # Instance

  doctest.before "Google::Cloud::Spanner::Instance" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :create_instance, create_instance_resp(client: mock_client) do |req|
        verify_mock_params(req, parent: "projects/my-project", instance_id: "my-new-instance", instance: Google::Cloud::Spanner::Admin::Instance::V1::Instance)
      end
      operation = job_grpc("google.spanner.admin.instance.v1.CreateInstanceMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-new-instance" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#save" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, Google::Cloud::Spanner::Admin::Instance::V1::Instance.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :update_instance, update_instance_resp(client: mock_client) do |req|
        verify_mock_params(req, instance: Google::Cloud::Spanner::Admin::Instance::V1::Instance, field_mask: Google::Protobuf::FieldMask)
      end
      operation = job_grpc("google.spanner.admin.instance.v1.UpdateInstanceMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#create_database" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      operation = job_grpc("google.spanner.admin.database.v1.CreateDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_database, create_database_resp(client: mock_client), [{
        parent: "projects/my-project/instances/my-instance",
        create_statement: "CREATE DATABASE `my-new-database`", extra_statements: [],
        encryption_config: nil
      }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#create_database@Create with encryption config" do
    kms_key_name = "projects/<project>/locations/<location>/keyRings/<key_ring>/cryptoKeys/<kms_key_name>"
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      operation = job_grpc("google.spanner.admin.database.v1.CreateDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_database, create_database_resp(client: mock_client), [{
        parent: "projects/my-project/instances/my-instance",
        create_statement: "CREATE DATABASE `my-new-database`", extra_statements: [],
        encryption_config: { kms_key_name: kms_key_name }
      }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#database" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#database@Will return `nil` if instance does not exist." do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_database, nil, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#databases" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :list_databases, databases_resp(token: "token"), [{ parent: "projects/my-project/instances/my-instance", page_size: nil, page_token: nil }, nil]
      mock_databases.expect :list_databases, databases_resp, [{ parent: "projects/my-project/instances/my-instance", page_size: nil, page_token: "token" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#policy" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :get_iam_policy, policy_resp, [{ resource: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :set_iam_policy, policy_resp do |req|
        verify_mock_params(req, resource: "projects/my-project/instances/my-instance", policy: Google::Iam::V1::Policy)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#update_policy" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :get_iam_policy, policy_resp, [{ resource: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :set_iam_policy, policy_resp do |req|
        verify_mock_params(req, resource: "projects/my-project/instances/my-instance", policy: Google::Iam::V1::Policy)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#test_permissions" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :test_iam_permissions, test_permissions_res, [{ resource: "projects/my-project/instances/my-instance", permissions: ["spanner.instances.get", "spanner.instances.update"] }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#delete" do
    mock_spanner do |mock, mock_instances, mock_databases|
       mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :delete_instance, nil, [{ name: "projects/my-project/instances/my-instance" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#database_operations" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_database_operations, database_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#database_operations@Filter and list" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_database_operations, database_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", filter: String)
      end
    end
  end

  # Instance::Config

  doctest.before "Google::Cloud::Spanner::Instance::Config" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :list_instance_configs, instance_configs_resp do |req|
        verify_mock_params(req, parent: "projects/my-project")
      end
    end
  end

  # Instance::List

  doctest.before "Google::Cloud::Spanner::Instance::List" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :list_instances, instances_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project")
      end
      mock_instances.expect :list_instances, instances_resp do |req|
        verify_mock_params(req, parent: "projects/my-project", page_token: "token")
      end
    end
  end

  # Instance::Config::List

  doctest.before "Google::Cloud::Spanner::Instance::Config::List" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :list_instance_configs, instance_configs_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project", page_size: nil, page_token: nil)
      end
      mock_instances.expect :list_instance_configs, instance_configs_resp do |req|
        verify_mock_params(req, parent: "projects/my-project", page_size: nil, page_token: "token")
      end
    end
  end

  # BatchClient

  doctest.before "Google::Cloud::Spanner::BatchClient" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_read, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", table: "users", key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :delete_session, session_grpc, [{ name: "session-name" }, Hash]
    end
  end

  # BatchSnapshot

  doctest.before "Google::Cloud::Spanner::BatchSnapshot" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_read, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", table: "users", key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :delete_session, session_grpc, [{ name: "session-name" }, Hash]
    end
  end

  doctest.before "Google::Cloud::Spanner::BatchSnapshot#partition_query" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_query, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :delete_session, session_grpc, [{ name: "session-name" }, Hash]
    end
  end

  doctest.before "Google::Cloud::Spanner::BatchSnapshot#execute" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String, transaction: Google::Cloud::Spanner::V1::TransactionSelector)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::BatchSnapshot#execute_sql" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::BatchSnapshot#execute_partition" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_read, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", table: "users", key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :delete_session, session_grpc, [{ name: "session-name" }, Hash]
    end
  end

  doctest.before "Google::Cloud::Spanner::BatchSnapshot#execute_sql_partition" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_read, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", table: "users", key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :delete_session, session_grpc, [{ name: "session-name" }, Hash]
    end
  end

  # BatchUpdate

  doctest.before "Google::Cloud::Spanner::BatchUpdate" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil}, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_batch_dml, batch_response_grpc do |req|
        verify_mock_params(req, session: "session-name", transaction: Google::Cloud::Spanner::V1::TransactionSelector, statements: Array, seqno: Integer)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  # Partition

  doctest.before "Google::Cloud::Spanner::Partition" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_read, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", table: "users", key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :delete_session, session_grpc, [{ name: "session-name" }, Hash]
    end
  end

  # Policy

  doctest.before "Google::Cloud::Spanner::Policy" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :get_iam_policy, policy_resp, [{ resource: "projects/my-project/instances/my-instance" }, nil]
      mock_instances.expect :set_iam_policy, policy_resp do |req|
        verify_mock_params(req, resource: "projects/my-project/instances/my-instance", policy: Google::Iam::V1::Policy)
      end
    end
  end

  # Project

  doctest.before "Google::Cloud::Spanner::Project" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project@Obtaining a client for use with a database." do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{ database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil}, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#batch_client" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :create_session, session_grpc, [{ database: "projects/my-project/instances/my-instance/databases/my-database", session: nil }, Hash]
      mock.expect :begin_transaction, tx_resp do |req|
        verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
      end
      mock.expect :partition_read, OpenStruct.new(partitions: [Google::Cloud::Spanner::V1::Partition.new(partition_token: "partition-token")]) do |req|
        verify_mock_params(req, session: "session-name", table: "users", key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :delete_session, session_grpc, [{ session: "session-name" }, Hash]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#client" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{ database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil}, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#create_instance" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :create_instance, create_instance_resp(client: mock_client) do |req|
        verify_mock_params(req, parent: "projects/my-project", instance_id: "my-new-instance", instance: Google::Cloud::Spanner::Admin::Instance::V1::Instance)
      end
      operation = job_grpc("google.spanner.admin.instance.v1.CreateInstanceMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-new-instance" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#instance" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#instance@Will return `nil` if instance does not exist." do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/non-existing" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#instances" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :list_instances, instances_resp(token: "token"), [{ parent: "projects/my-project", page_size: nil, page_token: nil }, nil]
      mock_instances.expect :list_instances, instances_resp, [{ parent: "projects/my-project", page_size: nil, page_token: "token" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#instance_config" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance_config, instance_config_resp, [{ name: "projects/my-project/instanceConfigs/regional-us-central1" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#instance_config@Will return `nil` if instance config does not exist." do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance_config, instance_config_resp, [{ name: "projects/my-project/instanceConfigs/non-existing" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#instance_configs" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :list_instance_configs, instance_configs_resp(token: "token"), [{ parent: "projects/my-project", page_size: nil, page_token: nil }, nil]
      mock_instances.expect :list_instance_configs, instance_configs_resp, [{ parent: "projects/my-project", page_size: nil, page_token: "token" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Project#create_database" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      operation = job_grpc("google.spanner.admin.database.v1.CreateDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_database, create_database_resp(client: mock_client), [{
          parent: "projects/my-project/instances/my-instance",
          create_statement: "CREATE DATABASE `my-new-database`",
          extra_statements: [], encryption_config: nil
      }, nil]
    end
  end

   doctest.before "Google::Cloud::Spanner::Project#create_database@Create with encryption config" do
    kms_key_name = "projects/<project>/locations/<location>/keyRings/<key_ring>/cryptoKeys/<kms_key_name>"
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      operation = job_grpc("google.spanner.admin.database.v1.CreateDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_database, create_database_resp(client: mock_client), [{
          parent: "projects/my-project/instances/my-instance",
          create_statement: "CREATE DATABASE `my-new-database`",
          extra_statements: [], encryption_config: { kms_key_name: kms_key_name }
      }, nil]
    end
  end


  doctest.before "Google::Cloud::Spanner::Project#databases" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :list_databases, databases_resp(token: "token"), [{ parent: "projects/my-project/instances/my-instance", page_size: nil, page_token: nil}, nil]
      mock_databases.expect :list_databases, databases_resp, [{ parent: "projects/my-project/instances/my-instance", page_size: nil, page_token: "token"}, nil]
    end
  end

  # Client

  doctest.before "Google::Cloud::Spanner::Client" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#execute" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#execute_sql" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#execute_partition_update" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      6.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#execute_pdml" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#transaction" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
      mock.expect :rollback, nil, [{ session: "session-name", transaction_id: "tx-001-02"}, Hash]
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#snapshot" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#fields" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end

    # TODO: Failing 1) wrong num args in Fields#data  2) undefined method `empty?' for #<Google::Cloud::Spanner::Data
  end

  doctest.before "Google::Cloud::Spanner::Client#range" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Client#read" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
    end
  end

  # CommitResponse

  doctest.before "Google::Cloud::Spanner::CommitResponse" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  # Commit

  doctest.before "Google::Cloud::Spanner::Commit" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  # Data

  doctest.before "Google::Cloud::Spanner::Data" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
    end
  end

  # Database

  doctest.before "Google::Cloud::Spanner::Database" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      operation = job_grpc("google.spanner.admin.database.v1.CreateDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_database, create_database_resp(client: mock_client), [{
        parent: "projects/my-project/instances/my-instance",
        create_statement: "CREATE DATABASE `my-new-database`", extra_statements: [],
        encryption_config: nil
      }, nil]
      mock_databases.expect :get_database, database_resp, [name: "projects/my-project/instances/my-instance/databases/my-new-database"]
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#ddl" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :get_database_ddl, database_ddl_resp, [{ database: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :get_database_ddl, database_ddl_resp, [{ database: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#policy" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :get_iam_policy, policy_resp, [{ resource: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :set_iam_policy, policy_resp do |req|
        verify_mock_params(req, resource: "projects/my-project/instances/my-instance/databases/my-database", policy: Google::Iam::V1::Policy)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#test_permissions" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :test_iam_permissions, test_permissions_res(permissions: ["spanner.databases.get"]),
                            [{ resource: "projects/my-project/instances/my-instance/databases/my-database", permissions: ["spanner.databases.get", "spanner.databases.update"] }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#update" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :update_database_ddl, nil, [Hash, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#update_policy" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :get_iam_policy, policy_resp, [{ resource: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :set_iam_policy, policy_resp do |req|
        req[:resource] == "projects/my-project/instances/my-instance/databases/my-database" && req[:policy].is_a?(Google::Iam::V1::Policy)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#drop" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :drop_database, nil, [{ database: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#database_operations" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_database_operations, database_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#database_operations@Filter and list" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_database_operations, database_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", filter: String)
      end
    end
  end

  # Database::List

  doctest.before "Google::Cloud::Spanner::Database::List" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :list_databases, databases_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
      mock_databases.expect :list_databases, databases_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", page_token: "token")
      end
    end
  end

  # Fields

  doctest.before "Google::Cloud::Spanner::Fields" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
    end
  end

  # ColumnValue

  doctest.before "Google::Cloud::Spanner::ColumnValue" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  # Range

  doctest.before "Google::Cloud::Spanner::Range" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
    end
  end

  # Results

  doctest.before "Google::Cloud::Spanner::Results" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
    end
  end

  # Rollback

  doctest.before "Google::Cloud::Spanner::Rollback" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users")
      end
      mock.expect :rollback, nil, [{ session: "session-name", transaction_id: "tx-001-02" }, Hash]
    end
  end

  # Snapshot

  doctest.before "Google::Cloud::Spanner::Snapshot" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Snapshot#execute_sql@Query using query parameters:" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users WHERE active = @active")
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Snapshot#range" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Snapshot#read" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Status" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      operation  = job_grpc("google.spanner.admin.database.v1.CreateDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_database, create_database_resp(client: mock_client), [{
        parent: "projects/my-project/instances/my-instance",
        create_statement: "CREATE DATABASE `my-new-database`", extra_statements: [],
        encryption_config: nil
      }, nil]
    end
  end

  # Transaction

  doctest.before "Google::Cloud::Spanner::Transaction" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum_marketing do |req|
        verify_mock_params(req, session: "session-name", table: "Albums", columns: ["marketing_budget"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :streaming_read, results_enum_marketing do |req|
        verify_mock_params(req, session: "session-name", table: "Albums", columns: ["marketing_budget"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#batch_update" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_batch_dml, batch_response_grpc do |req|
        verify_mock_params(req, session: "session-name", transaction: Google::Cloud::Spanner::V1::TransactionSelector, statements: Array, seqno: Integer)
        end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#execute" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#execute_sql" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#execute_update" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: String)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#execute_sql@Query using query parameters:" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :execute_streaming_sql, results_enum do |req|
        verify_mock_params(req, session: "session-name", sql: "SELECT * FROM users WHERE active = @active")
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#range" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
     end
    end
  end

  doctest.before "Google::Cloud::Spanner::Transaction#read" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock.expect :batch_create_sessions, OpenStruct.new(session: Array.new(10) { session_grpc }), [{database: "projects/my-project/instances/my-instance/databases/my-database", session_count: 10, session_template: nil }, Hash]
      5.times do
        mock.expect :begin_transaction, tx_resp do |req|
          verify_mock_params(req, session: "session-name", options: Google::Cloud::Spanner::V1::TransactionOptions)
        end
      end
      mock.expect :streaming_read, results_enum do |req|
        verify_mock_params(req, session: "session-name", table: "users", columns: ["id", "name"], key_set: Google::Cloud::Spanner::V1::KeySet)
      end
      mock.expect :commit, commit_resp do |req|
        verify_mock_params(req, session: "session-name", mutations: Array)
      end
    end
  end

  # Backup

  doctest.before "Google::Cloud::Spanner::Database#create_backup" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      operation = job_grpc("type.googleapis.com/google.spanner.admin.database.v1.CreateBackupMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_backup, create_backup_resp(client: mock_client) do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", backup_id: "my-backup", backup: Hash)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#backup" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#backup@Will return `nil` if backup does not exist." do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, nil, [{ name: "projects/my-project/instances/my-instance/backups/non-existing-backup" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#backups" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", page_size: nil, page_token: nil)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#backups@Filter and list backups" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", filter: String)
      end
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", filter: String)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Database#backups" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_databases.expect :get_database, OpenStruct.new(database_hash), [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", filter: String)
      end
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", filter: String)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      operation = job_grpc("google.spanner.admin.database.v1.CreateBackupMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
      mock_databases.expect :create_backup, create_backup_resp(client: mock_client) do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", backup_id: "my-backup", backup: Hash)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup#expire_time=" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
      mock_databases.expect :update_backup, backup_resp do |req|
        verify_mock_params(req, backup: Google::Cloud::Spanner::Admin::Database::V1::Backup, update_mask: Google::Protobuf::FieldMask)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup#delete" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
      mock_databases.expect :delete_backup, nil, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup#referencing_databases" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp(referencing_databases: ["my-database"]), [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
      mock_databases.expect :get_database, database_resp(database_id: "my-database"), [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup::Job#cancel" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_databases.expect :get_database, database_resp, [{ name: "projects/my-project/instances/my-instance/databases/my-database" }, nil]
      mock_client.expect :cancel_operation, nil, [{ name: "1234567890"}, Gapic::CallOptions]
      mock_databases.expect :create_backup, create_backup_resp(client: mock_client) do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance", backup_id: "my-backup", backup: Hash)
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup#restore" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
      mock_databases.expect :restore_database, create_backup_restore_resp(client: mock_client) do |req|
        verify_mock_params(req,
          parent: "projects/my-project/instances/my-instance",
          database_id: "my-restored-database",
          backup: "projects/my-project/instances/my-instance/backups/my-backup"
        )
      end
      operation = job_grpc("google.spanner.admin.database.v1.RestoreDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup#restore@Restore database in provided instance id" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
      mock_databases.expect :restore_database, create_backup_restore_resp(client: mock_client) do |req|
        verify_mock_params(req,
          parent: "projects/my-project/instances/other-instance",
          database_id: "my-restored-database",
          backup: "projects/my-project/instances/my-instance/backups/my-backup"
        )
      end
      operation = job_grpc("google.spanner.admin.database.v1.RestoreDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
    end
  end

  doctest.before "Google::Cloud::Spanner::Backup::Restore::Job" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :get_backup, backup_resp, [{ name: "projects/my-project/instances/my-instance/backups/my-backup" }, nil]
      mock_databases.expect :restore_database, create_backup_restore_resp(client: mock_client) do |req|
        verify_mock_params(req,
          parent: "projects/my-project/instances/my-instance",
          database_id: "my-restored-database",
          backup: "projects/my-project/instances/my-instance/backups/my-backup"
        )
      end
      operation = job_grpc("google.spanner.admin.database.v1.RestoreDatabaseMetadata", done: true)
      mock_client.expect :get_operation, OpenStruct.new(grpc_op: operation), [{ name: "1234567890" }, Gapic::CallOptions]
    end
  end

  # Backup::List

  doctest.before "Google::Cloud::Spanner::Backup::List" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
      mock_databases.expect :list_backups, backups_resp(token: "token") do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end

  # Database::Job::List

  doctest.before "Google::Cloud::Spanner::Database::Job::List" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_database_operations, database_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end

  # Backup::Job::List

  doctest.before "Google::Cloud::Spanner::Backup::Job::List" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_backup_operations, backup_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end

  # Instance - backup operations

  doctest.before "Google::Cloud::Spanner::Instance#backup_operations" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_backup_operations, backup_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end

  doctest.before "Google::Cloud::Spanner::Instance#backup_operations@Filter and list" do
    mock_spanner do |mock, mock_instances, mock_databases|
      mock_client = Minitest::Mock.new
      mock_instances.expect :get_instance, OpenStruct.new(instance_hash), [{ name: "projects/my-project/instances/my-instance" }, nil]
      mock_databases.expect :instance_variable_get, mock_client, ["@operations_client"]
      mock_databases.expect :list_backup_operations, backup_operations_resp do |req|
        verify_mock_params(req, parent: "projects/my-project/instances/my-instance")
      end
    end
  end
end

# Stubs

def something_wrong?
  true
end

# Fixtures
def project
  "my-project"
end

def instance_hash name: "my-instance", nodes: 1, state: "READY", labels: {}
  {
    name: "projects/#{project}/instances/#{name}",
    config: "projects/#{project}/instanceConfigs/regional-us-central1",
    display_name: name.split("-").map(&:capitalize).join(" "),
    nodeCount: nodes,
    state: state,
    labels: labels
  }
end

def job_grpc type_url, value: "", done: false
  Google::Longrunning::Operation.new(
    name: "1234567890",
    done: done,
    metadata: {
      type_url: type_url,
      value: value
    }
  )
end

def create_instance_resp client: nil
  Gapic::Operation.new(
    job_grpc("google.spanner.admin.instance.v1.CreateInstanceMetadata"),
    client,
    result_type: Google::Cloud::Spanner::Admin::Instance::V1::Instance,
    metadata_type: Google::Cloud::Spanner::Admin::Instance::V1::CreateInstanceMetadata
  )
end

def update_instance_resp client: nil
  Gapic::Operation.new(
    job_grpc("google.spanner.admin.instance.v1.UpdateInstanceMetadata"),
    client,
    result_type: Google::Cloud::Spanner::Admin::Instance::V1::Instance,
    metadata_type: Google::Cloud::Spanner::Admin::Instance::V1::UpdateInstanceMetadata
  )
end

def instance_configs_hash
  {
    instance_configs: [
      { name: "projects/#{project}/instanceConfigs/regional-europe-west1",
        display_name: "EU West 1"},
        { name: "projects/#{project}/instanceConfigs/regional-us-west1",
          display_name: "US West 1"},
          { name: "projects/#{project}/instanceConfigs/regional-us-central1",
            display_name: "US Central 1"}
    ]
  }
end

def instance_config_hash
  instance_configs_hash[:instance_configs].last
end

def instance_config_resp
  Google::Cloud::Spanner::Admin::Instance::V1::InstanceConfig.new instance_config_hash
end

def instance_configs_resp token: nil
  h = instance_configs_hash
  h[:next_page_token] = token if token
  response = Google::Cloud::Spanner::Admin::Instance::V1::ListInstanceConfigsResponse.new h
  paged_enum_struct response
end

def instances_hash
  { instances: [instance_hash] }
end

def instance_hash name: "my-instance", nodes: 1, state: "READY", labels: {}
  {
    name: "projects/#{project}/instances/#{name}",
    config: "projects/#{project}/instanceConfigs/regional-us-central1",
    display_name: name.split("-").map(&:capitalize).join(" "),
    node_count: nodes,
    state: state,
    labels: labels
  }
end

def instances_resp token: nil
  h = instances_hash
  h[:next_page_token] = token if token
  response = Google::Cloud::Spanner::Admin::Instance::V1::ListInstancesResponse.new h
  paged_enum_struct response
end

def create_database_resp client: nil
  Gapic::Operation.new(
    job_grpc("google.spanner.admin.database.v1.CreateDatabaseRequest"),
    client,
    result_type: Google::Cloud::Spanner::Admin::Database::V1::Database,
    metadata_type: Google::Cloud::Spanner::Admin::Database::V1::CreateDatabaseMetadata
  )
end

def databases_hash instance_id: "my-instance"
  { databases: [database_hash(instance_id: instance_id)] }
end

def database_hash instance_id: "my-instance", database_id: "my-database", state: "READY"
  {
    name: "projects/#{project}/instances/#{instance_id}/databases/#{database_id}",
    state: state
  }
end

def database_resp instance_id: "my-instance", database_id: "my-database"
  Google::Cloud::Spanner::Admin::Database::V1::Database.new database_hash(instance_id: instance_id, database_id: database_id)
end

def databases_resp token: nil
  h = databases_hash
  h[:next_page_token] = token if token
  response = Google::Cloud::Spanner::Admin::Database::V1::ListDatabasesResponse.new h
  paged_enum_struct response
end

def database_ddl_resp
  Google::Cloud::Spanner::Admin::Database::V1::GetDatabaseDdlResponse.new(
    statements: ["CREATE TABLE table1", "CREATE TABLE table2", "CREATE TABLE table3"]
  )
end

def session_grpc
  Google::Cloud::Spanner::V1::Session.new(name: "session-name")
end

def policy_hash
  {
    etag: "\b\x01",
    bindings: [{
      role: "roles/viewer",
      members: [
        "user:viewer@example.com",
        "serviceAccount:1234567890@developer.gserviceaccount.com"
      ]
    }]
  }
end

def policy_resp
  Google::Iam::V1::Policy.new policy_hash
end

def test_permissions_res permissions: ["spanner.instances.get"]
  Google::Iam::V1::TestIamPermissionsResponse.new(
    permissions: permissions
  )
end

def paged_enum_struct response
  OpenStruct.new(response: response)
end

def tx_resp
  Google::Cloud::Spanner::V1::Transaction.new(id: "tx-001-02")
end

def results_hash1
  {
    metadata: {
      row_type: {
        fields: [
          { name: "id",          type: { code: :INT64 } },
          { name: "name",        type: { code: :STRING } },
          { name: "active",      type: { code: :BOOL } },
          { name: "age",         type: { code: :INT64 } },
          { name: "score",       type: { code: :FLOAT64 } },
          { name: "updated_at",  type: { code: :TIMESTAMP } },
          { name: "birthday",    type: { code: :DATE} },
          { name: "avatar",      type: { code: :BYTES } },
          { name: "project_ids", type: { code: :ARRAY,
                                         array_element_type: { code: :INT64 } } }
        ]
      }
    },
    stats: {
      row_count_exact: 1
    }
  }
end

def results_hash_marketing
  {
    metadata: {
      row_type: {
        fields: [
          { name: "marketing_budget", type: { code: :INT64 } }
        ]
      }
    }
  }
end

def results_hash_marketing_2
  {
    values: [
      { string_value: "400000" }
    ]
  }
end

def results_enum
  [Google::Cloud::Spanner::V1::PartialResultSet.new(results_hash1)].to_enum
end

def results_enum_marketing
  [
    Google::Cloud::Spanner::V1::PartialResultSet.new(results_hash_marketing),
    Google::Cloud::Spanner::V1::PartialResultSet.new(results_hash_marketing_2)
  ].to_enum
end

def batch_result_sets_grpc count, row_count_exact: 1
  count.times.map do
    Google::Cloud::Spanner::V1::ResultSet.new(
      stats: Google::Cloud::Spanner::V1::ResultSetStats.new(
        row_count_exact: row_count_exact
      )
    )
  end
end

def batch_response_grpc count = 1
  Google::Cloud::Spanner::V1::ExecuteBatchDmlResponse.new(
    result_sets: batch_result_sets_grpc(count),
    status: Google::Rpc::Status.new(code: 0)
  )
end

def commit_timestamp
  Google::Cloud::Spanner::Convert.time_to_timestamp Time.now
end

def commit_resp
  Google::Cloud::Spanner::V1::CommitResponse.new(
    commit_timestamp: commit_timestamp,
    commit_stats: Google::Cloud::Spanner::V1::CommitResponse::CommitStats.new(
      mutation_count: 5
    )
  )
end

def backup_hash \
    instance_id: "my-instance",
    database_id: "my_databse",
    backup_id: "my-backup",
    state: "READY",
    referencing_databases: ["db1"]
  {
    name: "projects/#{project}/instances/#{instance_id}/backups/#{backup_id}",
    database: "projects/#{project}/instances/#{instance_id}/databases/#{database_id}",
    state: state,
    referencing_databases: referencing_databases.map do |database|
      "projects/#{project}/instances/#{instance_id}/databases/#{database}"
    end
  }
end

def backups_hash instance_id: "my-instance"
  { backups: [backup_hash(instance_id: instance_id)] }
end

def create_backup_resp client: nil
  Gapic::Operation.new(
    job_grpc("google.spanner.admin.database.v1.CreateBackupRequest"),
    client,
    result_type: Google::Cloud::Spanner::Admin::Database::V1::Backup,
    metadata_type: Google::Cloud::Spanner::Admin::Database::V1::CreateBackupMetadata
  )
end

def backup_resp instance_id: "my-instance", database_id: "my-database", backup_id: "my-backup", referencing_databases: ["db1"]
  Google::Cloud::Spanner::Admin::Database::V1::Backup.new backup_hash(
    instance_id: instance_id,
    database_id: database_id,
    backup_id: backup_id,
    referencing_databases: referencing_databases
  )
end

def backups_resp token: nil
  h = backups_hash
  h[:next_page_token] = token if token
  response = Google::Cloud::Spanner::Admin::Database::V1::ListBackupsResponse.new h
  OpenStruct.new response: response
end

def backup_operation_grpc
  Google::Longrunning::Operation.new({
    name: "1234567890",
    metadata: Google::Protobuf::Any.new(
      type_url: "google.spanner.admin.database.v1.CreateBackupMetadata",
      value: Google::Cloud::Spanner::Admin::Database::V1::CreateBackupMetadata.new.to_proto
    ),
    done: true,
    response: Google::Protobuf::Any.new(
      type_url: "google.spanner.admin.database.v1.Backup",
      value: Google::Cloud::Spanner::Admin::Database::V1::Backup.new(backup_hash).to_proto
    )
  })
end

def backup_operations_hash
  { operations: [backup_operation_grpc] }
end

def backup_operations_resp token: nil
  h = backup_operations_hash
  h[:next_page_token] = token if token
  response = Google::Cloud::Spanner::Admin::Database::V1::ListBackupOperationsResponse.new h
  OpenStruct.new response: response
end

def database_operation_grpc
  Google::Longrunning::Operation.new(
    name: "1234567890",
    metadata: Google::Protobuf::Any.new(
      type_url: "google.spanner.admin.database.v1.CreateDatabaseMetadata",
      value: Google::Cloud::Spanner::Admin::Database::V1::CreateDatabaseMetadata.new.to_proto
    ),
    done: true,
    response: Google::Protobuf::Any.new(
      type_url: "google.spanner.admin.database.v1.Database",
      value: Google::Cloud::Spanner::Admin::Database::V1::Database.new(database_hash).to_proto
    )
  )
end

def database_operations_hash
  { operations: [database_operation_grpc] }
end

def database_operations_resp token: nil
  h = database_operations_hash
  h[:next_page_token] = token if token
  response = Google::Cloud::Spanner::Admin::Database::V1::ListDatabaseOperationsResponse.new h
  OpenStruct.new response: response
end

def create_backup_restore_resp client: nil
  Gapic::Operation.new(
    job_grpc("google.spanner.admin.database.v1.RestoreDatabaseRequest"),
    client,
    result_type: Google::Cloud::Spanner::Admin::Database::V1::Database,
    metadata_type: Google::Cloud::Spanner::Admin::Database::V1::RestoreDatabaseMetadata
  )
end
