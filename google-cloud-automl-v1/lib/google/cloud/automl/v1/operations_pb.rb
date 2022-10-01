# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/automl/v1/operations.proto

require 'google/protobuf'

require 'google/cloud/automl/v1/io_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/automl/v1/operations.proto", :syntax => :proto3) do
    add_message "google.cloud.automl.v1.OperationMetadata" do
      optional :progress_percent, :int32, 13
      repeated :partial_failures, :message, 2, "google.rpc.Status"
      optional :create_time, :message, 3, "google.protobuf.Timestamp"
      optional :update_time, :message, 4, "google.protobuf.Timestamp"
      oneof :details do
        optional :delete_details, :message, 8, "google.cloud.automl.v1.DeleteOperationMetadata"
        optional :deploy_model_details, :message, 24, "google.cloud.automl.v1.DeployModelOperationMetadata"
        optional :undeploy_model_details, :message, 25, "google.cloud.automl.v1.UndeployModelOperationMetadata"
        optional :create_model_details, :message, 10, "google.cloud.automl.v1.CreateModelOperationMetadata"
        optional :create_dataset_details, :message, 30, "google.cloud.automl.v1.CreateDatasetOperationMetadata"
        optional :import_data_details, :message, 15, "google.cloud.automl.v1.ImportDataOperationMetadata"
        optional :batch_predict_details, :message, 16, "google.cloud.automl.v1.BatchPredictOperationMetadata"
        optional :export_data_details, :message, 21, "google.cloud.automl.v1.ExportDataOperationMetadata"
        optional :export_model_details, :message, 22, "google.cloud.automl.v1.ExportModelOperationMetadata"
      end
    end
    add_message "google.cloud.automl.v1.DeleteOperationMetadata" do
    end
    add_message "google.cloud.automl.v1.DeployModelOperationMetadata" do
    end
    add_message "google.cloud.automl.v1.UndeployModelOperationMetadata" do
    end
    add_message "google.cloud.automl.v1.CreateDatasetOperationMetadata" do
    end
    add_message "google.cloud.automl.v1.CreateModelOperationMetadata" do
    end
    add_message "google.cloud.automl.v1.ImportDataOperationMetadata" do
    end
    add_message "google.cloud.automl.v1.ExportDataOperationMetadata" do
      optional :output_info, :message, 1, "google.cloud.automl.v1.ExportDataOperationMetadata.ExportDataOutputInfo"
    end
    add_message "google.cloud.automl.v1.ExportDataOperationMetadata.ExportDataOutputInfo" do
      oneof :output_location do
        optional :gcs_output_directory, :string, 1
      end
    end
    add_message "google.cloud.automl.v1.BatchPredictOperationMetadata" do
      optional :input_config, :message, 1, "google.cloud.automl.v1.BatchPredictInputConfig"
      optional :output_info, :message, 2, "google.cloud.automl.v1.BatchPredictOperationMetadata.BatchPredictOutputInfo"
    end
    add_message "google.cloud.automl.v1.BatchPredictOperationMetadata.BatchPredictOutputInfo" do
      oneof :output_location do
        optional :gcs_output_directory, :string, 1
      end
    end
    add_message "google.cloud.automl.v1.ExportModelOperationMetadata" do
      optional :output_info, :message, 2, "google.cloud.automl.v1.ExportModelOperationMetadata.ExportModelOutputInfo"
    end
    add_message "google.cloud.automl.v1.ExportModelOperationMetadata.ExportModelOutputInfo" do
      optional :gcs_output_directory, :string, 1
    end
  end
end

module Google
  module Cloud
    module AutoML
      module V1
        OperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.OperationMetadata").msgclass
        DeleteOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.DeleteOperationMetadata").msgclass
        DeployModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.DeployModelOperationMetadata").msgclass
        UndeployModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.UndeployModelOperationMetadata").msgclass
        CreateDatasetOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.CreateDatasetOperationMetadata").msgclass
        CreateModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.CreateModelOperationMetadata").msgclass
        ImportDataOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.ImportDataOperationMetadata").msgclass
        ExportDataOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.ExportDataOperationMetadata").msgclass
        ExportDataOperationMetadata::ExportDataOutputInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.ExportDataOperationMetadata.ExportDataOutputInfo").msgclass
        BatchPredictOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.BatchPredictOperationMetadata").msgclass
        BatchPredictOperationMetadata::BatchPredictOutputInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.BatchPredictOperationMetadata.BatchPredictOutputInfo").msgclass
        ExportModelOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.ExportModelOperationMetadata").msgclass
        ExportModelOperationMetadata::ExportModelOutputInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.automl.v1.ExportModelOperationMetadata.ExportModelOutputInfo").msgclass
      end
    end
  end
end
