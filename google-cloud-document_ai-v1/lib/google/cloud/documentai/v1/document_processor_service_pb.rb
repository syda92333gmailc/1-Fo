# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/documentai/v1/document_processor_service.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/documentai/v1/document_pb'
require 'google/cloud/documentai/v1/document_io_pb'
require 'google/cloud/documentai/v1/document_schema_pb'
require 'google/cloud/documentai/v1/operation_metadata_pb'
require 'google/cloud/documentai/v1/processor_pb'
require 'google/cloud/documentai/v1/processor_type_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/documentai/v1/document_processor_service.proto", :syntax => :proto3) do
    add_message "google.cloud.documentai.v1.ProcessRequest" do
      optional :name, :string, 1
      optional :skip_human_review, :bool, 3
      optional :field_mask, :message, 6, "google.protobuf.FieldMask"
      oneof :source do
        optional :inline_document, :message, 4, "google.cloud.documentai.v1.Document"
        optional :raw_document, :message, 5, "google.cloud.documentai.v1.RawDocument"
      end
    end
    add_message "google.cloud.documentai.v1.HumanReviewStatus" do
      optional :state, :enum, 1, "google.cloud.documentai.v1.HumanReviewStatus.State"
      optional :state_message, :string, 2
      optional :human_review_operation, :string, 3
    end
    add_enum "google.cloud.documentai.v1.HumanReviewStatus.State" do
      value :STATE_UNSPECIFIED, 0
      value :SKIPPED, 1
      value :VALIDATION_PASSED, 2
      value :IN_PROGRESS, 3
      value :ERROR, 4
    end
    add_message "google.cloud.documentai.v1.ProcessResponse" do
      optional :document, :message, 1, "google.cloud.documentai.v1.Document"
      optional :human_review_status, :message, 3, "google.cloud.documentai.v1.HumanReviewStatus"
    end
    add_message "google.cloud.documentai.v1.BatchProcessRequest" do
      optional :name, :string, 1
      optional :input_documents, :message, 5, "google.cloud.documentai.v1.BatchDocumentsInputConfig"
      optional :document_output_config, :message, 6, "google.cloud.documentai.v1.DocumentOutputConfig"
      optional :skip_human_review, :bool, 4
    end
    add_message "google.cloud.documentai.v1.BatchProcessResponse" do
    end
    add_message "google.cloud.documentai.v1.BatchProcessMetadata" do
      optional :state, :enum, 1, "google.cloud.documentai.v1.BatchProcessMetadata.State"
      optional :state_message, :string, 2
      optional :create_time, :message, 3, "google.protobuf.Timestamp"
      optional :update_time, :message, 4, "google.protobuf.Timestamp"
      repeated :individual_process_statuses, :message, 5, "google.cloud.documentai.v1.BatchProcessMetadata.IndividualProcessStatus"
    end
    add_message "google.cloud.documentai.v1.BatchProcessMetadata.IndividualProcessStatus" do
      optional :input_gcs_source, :string, 1
      optional :status, :message, 2, "google.rpc.Status"
      optional :output_gcs_destination, :string, 3
      optional :human_review_status, :message, 5, "google.cloud.documentai.v1.HumanReviewStatus"
    end
    add_enum "google.cloud.documentai.v1.BatchProcessMetadata.State" do
      value :STATE_UNSPECIFIED, 0
      value :WAITING, 1
      value :RUNNING, 2
      value :SUCCEEDED, 3
      value :CANCELLING, 4
      value :CANCELLED, 5
      value :FAILED, 6
    end
    add_message "google.cloud.documentai.v1.FetchProcessorTypesRequest" do
      optional :parent, :string, 1
    end
    add_message "google.cloud.documentai.v1.FetchProcessorTypesResponse" do
      repeated :processor_types, :message, 1, "google.cloud.documentai.v1.ProcessorType"
    end
    add_message "google.cloud.documentai.v1.ListProcessorTypesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.documentai.v1.ListProcessorTypesResponse" do
      repeated :processor_types, :message, 1, "google.cloud.documentai.v1.ProcessorType"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.documentai.v1.ListProcessorsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.documentai.v1.ListProcessorsResponse" do
      repeated :processors, :message, 1, "google.cloud.documentai.v1.Processor"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.documentai.v1.GetProcessorRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.GetProcessorVersionRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.ListProcessorVersionsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.documentai.v1.ListProcessorVersionsResponse" do
      repeated :processor_versions, :message, 1, "google.cloud.documentai.v1.ProcessorVersion"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.documentai.v1.DeleteProcessorVersionRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.DeleteProcessorVersionMetadata" do
      optional :common_metadata, :message, 1, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.DeployProcessorVersionRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.DeployProcessorVersionResponse" do
    end
    add_message "google.cloud.documentai.v1.DeployProcessorVersionMetadata" do
      optional :common_metadata, :message, 1, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.UndeployProcessorVersionRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.UndeployProcessorVersionResponse" do
    end
    add_message "google.cloud.documentai.v1.UndeployProcessorVersionMetadata" do
      optional :common_metadata, :message, 1, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.CreateProcessorRequest" do
      optional :parent, :string, 1
      optional :processor, :message, 2, "google.cloud.documentai.v1.Processor"
    end
    add_message "google.cloud.documentai.v1.DeleteProcessorRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.DeleteProcessorMetadata" do
      optional :common_metadata, :message, 5, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.EnableProcessorRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.EnableProcessorResponse" do
    end
    add_message "google.cloud.documentai.v1.EnableProcessorMetadata" do
      optional :common_metadata, :message, 5, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.DisableProcessorRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.documentai.v1.DisableProcessorResponse" do
    end
    add_message "google.cloud.documentai.v1.DisableProcessorMetadata" do
      optional :common_metadata, :message, 5, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.SetDefaultProcessorVersionRequest" do
      optional :processor, :string, 1
      optional :default_processor_version, :string, 2
    end
    add_message "google.cloud.documentai.v1.SetDefaultProcessorVersionResponse" do
    end
    add_message "google.cloud.documentai.v1.SetDefaultProcessorVersionMetadata" do
      optional :common_metadata, :message, 1, "google.cloud.documentai.v1.CommonOperationMetadata"
    end
    add_message "google.cloud.documentai.v1.ReviewDocumentRequest" do
      optional :human_review_config, :string, 1
      optional :enable_schema_validation, :bool, 3
      optional :priority, :enum, 5, "google.cloud.documentai.v1.ReviewDocumentRequest.Priority"
      optional :document_schema, :message, 6, "google.cloud.documentai.v1.DocumentSchema"
      oneof :source do
        optional :inline_document, :message, 4, "google.cloud.documentai.v1.Document"
      end
    end
    add_enum "google.cloud.documentai.v1.ReviewDocumentRequest.Priority" do
      value :DEFAULT, 0
      value :URGENT, 1
    end
    add_message "google.cloud.documentai.v1.ReviewDocumentResponse" do
      optional :gcs_destination, :string, 1
      optional :state, :enum, 2, "google.cloud.documentai.v1.ReviewDocumentResponse.State"
      optional :rejection_reason, :string, 3
    end
    add_enum "google.cloud.documentai.v1.ReviewDocumentResponse.State" do
      value :STATE_UNSPECIFIED, 0
      value :REJECTED, 1
      value :SUCCEEDED, 2
    end
    add_message "google.cloud.documentai.v1.ReviewDocumentOperationMetadata" do
      optional :common_metadata, :message, 5, "google.cloud.documentai.v1.CommonOperationMetadata"
      optional :question_id, :string, 6
    end
  end
end

module Google
  module Cloud
    module DocumentAI
      module V1
        ProcessRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ProcessRequest").msgclass
        HumanReviewStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.HumanReviewStatus").msgclass
        HumanReviewStatus::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.HumanReviewStatus.State").enummodule
        ProcessResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ProcessResponse").msgclass
        BatchProcessRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.BatchProcessRequest").msgclass
        BatchProcessResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.BatchProcessResponse").msgclass
        BatchProcessMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.BatchProcessMetadata").msgclass
        BatchProcessMetadata::IndividualProcessStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.BatchProcessMetadata.IndividualProcessStatus").msgclass
        BatchProcessMetadata::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.BatchProcessMetadata.State").enummodule
        FetchProcessorTypesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.FetchProcessorTypesRequest").msgclass
        FetchProcessorTypesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.FetchProcessorTypesResponse").msgclass
        ListProcessorTypesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ListProcessorTypesRequest").msgclass
        ListProcessorTypesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ListProcessorTypesResponse").msgclass
        ListProcessorsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ListProcessorsRequest").msgclass
        ListProcessorsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ListProcessorsResponse").msgclass
        GetProcessorRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.GetProcessorRequest").msgclass
        GetProcessorVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.GetProcessorVersionRequest").msgclass
        ListProcessorVersionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ListProcessorVersionsRequest").msgclass
        ListProcessorVersionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ListProcessorVersionsResponse").msgclass
        DeleteProcessorVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeleteProcessorVersionRequest").msgclass
        DeleteProcessorVersionMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeleteProcessorVersionMetadata").msgclass
        DeployProcessorVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeployProcessorVersionRequest").msgclass
        DeployProcessorVersionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeployProcessorVersionResponse").msgclass
        DeployProcessorVersionMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeployProcessorVersionMetadata").msgclass
        UndeployProcessorVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.UndeployProcessorVersionRequest").msgclass
        UndeployProcessorVersionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.UndeployProcessorVersionResponse").msgclass
        UndeployProcessorVersionMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.UndeployProcessorVersionMetadata").msgclass
        CreateProcessorRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.CreateProcessorRequest").msgclass
        DeleteProcessorRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeleteProcessorRequest").msgclass
        DeleteProcessorMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DeleteProcessorMetadata").msgclass
        EnableProcessorRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.EnableProcessorRequest").msgclass
        EnableProcessorResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.EnableProcessorResponse").msgclass
        EnableProcessorMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.EnableProcessorMetadata").msgclass
        DisableProcessorRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DisableProcessorRequest").msgclass
        DisableProcessorResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DisableProcessorResponse").msgclass
        DisableProcessorMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.DisableProcessorMetadata").msgclass
        SetDefaultProcessorVersionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.SetDefaultProcessorVersionRequest").msgclass
        SetDefaultProcessorVersionResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.SetDefaultProcessorVersionResponse").msgclass
        SetDefaultProcessorVersionMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.SetDefaultProcessorVersionMetadata").msgclass
        ReviewDocumentRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ReviewDocumentRequest").msgclass
        ReviewDocumentRequest::Priority = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ReviewDocumentRequest.Priority").enummodule
        ReviewDocumentResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ReviewDocumentResponse").msgclass
        ReviewDocumentResponse::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ReviewDocumentResponse.State").enummodule
        ReviewDocumentOperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1.ReviewDocumentOperationMetadata").msgclass
      end
    end
  end
end
