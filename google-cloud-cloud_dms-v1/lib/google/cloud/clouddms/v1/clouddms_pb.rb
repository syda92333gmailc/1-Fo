# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/clouddms/v1/clouddms.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/clouddms/v1/clouddms_resources_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/clouddms/v1/clouddms.proto", :syntax => :proto3) do
    add_message "google.cloud.clouddms.v1.ListMigrationJobsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.clouddms.v1.ListMigrationJobsResponse" do
      repeated :migration_jobs, :message, 1, "google.cloud.clouddms.v1.MigrationJob"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.clouddms.v1.GetMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.CreateMigrationJobRequest" do
      optional :parent, :string, 1
      optional :migration_job_id, :string, 2
      optional :migration_job, :message, 3, "google.cloud.clouddms.v1.MigrationJob"
      optional :request_id, :string, 4
    end
    add_message "google.cloud.clouddms.v1.UpdateMigrationJobRequest" do
      optional :update_mask, :message, 1, "google.protobuf.FieldMask"
      optional :migration_job, :message, 2, "google.cloud.clouddms.v1.MigrationJob"
      optional :request_id, :string, 3
    end
    add_message "google.cloud.clouddms.v1.DeleteMigrationJobRequest" do
      optional :name, :string, 1
      optional :request_id, :string, 2
      optional :force, :bool, 3
    end
    add_message "google.cloud.clouddms.v1.StartMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.StopMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.ResumeMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.PromoteMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.VerifyMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.RestartMigrationJobRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.GenerateSshScriptRequest" do
      optional :migration_job, :string, 1
      optional :vm, :string, 2
      optional :vm_port, :int32, 3
      oneof :vm_config do
        optional :vm_creation_config, :message, 100, "google.cloud.clouddms.v1.VmCreationConfig"
        optional :vm_selection_config, :message, 101, "google.cloud.clouddms.v1.VmSelectionConfig"
      end
    end
    add_message "google.cloud.clouddms.v1.VmCreationConfig" do
      optional :vm_machine_type, :string, 1
      optional :vm_zone, :string, 2
      optional :subnet, :string, 3
    end
    add_message "google.cloud.clouddms.v1.VmSelectionConfig" do
      optional :vm_zone, :string, 1
    end
    add_message "google.cloud.clouddms.v1.SshScript" do
      optional :script, :string, 1
    end
    add_message "google.cloud.clouddms.v1.ListConnectionProfilesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.clouddms.v1.ListConnectionProfilesResponse" do
      repeated :connection_profiles, :message, 1, "google.cloud.clouddms.v1.ConnectionProfile"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.clouddms.v1.GetConnectionProfileRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.clouddms.v1.CreateConnectionProfileRequest" do
      optional :parent, :string, 1
      optional :connection_profile_id, :string, 2
      optional :connection_profile, :message, 3, "google.cloud.clouddms.v1.ConnectionProfile"
      optional :request_id, :string, 4
    end
    add_message "google.cloud.clouddms.v1.UpdateConnectionProfileRequest" do
      optional :update_mask, :message, 1, "google.protobuf.FieldMask"
      optional :connection_profile, :message, 2, "google.cloud.clouddms.v1.ConnectionProfile"
      optional :request_id, :string, 3
    end
    add_message "google.cloud.clouddms.v1.DeleteConnectionProfileRequest" do
      optional :name, :string, 1
      optional :request_id, :string, 2
      optional :force, :bool, 3
    end
    add_message "google.cloud.clouddms.v1.OperationMetadata" do
      optional :create_time, :message, 1, "google.protobuf.Timestamp"
      optional :end_time, :message, 2, "google.protobuf.Timestamp"
      optional :target, :string, 3
      optional :verb, :string, 4
      optional :status_message, :string, 5
      optional :requested_cancellation, :bool, 6
      optional :api_version, :string, 7
    end
  end
end

module Google
  module Cloud
    module CloudDMS
      module V1
        ListMigrationJobsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.ListMigrationJobsRequest").msgclass
        ListMigrationJobsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.ListMigrationJobsResponse").msgclass
        GetMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.GetMigrationJobRequest").msgclass
        CreateMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.CreateMigrationJobRequest").msgclass
        UpdateMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.UpdateMigrationJobRequest").msgclass
        DeleteMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.DeleteMigrationJobRequest").msgclass
        StartMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.StartMigrationJobRequest").msgclass
        StopMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.StopMigrationJobRequest").msgclass
        ResumeMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.ResumeMigrationJobRequest").msgclass
        PromoteMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.PromoteMigrationJobRequest").msgclass
        VerifyMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.VerifyMigrationJobRequest").msgclass
        RestartMigrationJobRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.RestartMigrationJobRequest").msgclass
        GenerateSshScriptRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.GenerateSshScriptRequest").msgclass
        VmCreationConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.VmCreationConfig").msgclass
        VmSelectionConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.VmSelectionConfig").msgclass
        SshScript = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.SshScript").msgclass
        ListConnectionProfilesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.ListConnectionProfilesRequest").msgclass
        ListConnectionProfilesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.ListConnectionProfilesResponse").msgclass
        GetConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.GetConnectionProfileRequest").msgclass
        CreateConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.CreateConnectionProfileRequest").msgclass
        UpdateConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.UpdateConnectionProfileRequest").msgclass
        DeleteConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.DeleteConnectionProfileRequest").msgclass
        OperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.clouddms.v1.OperationMetadata").msgclass
      end
    end
  end
end