# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/serviceusage/v1/serviceusage.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/serviceusage/v1/resources_pb'
require 'google/longrunning/operations_pb'
require 'google/api/client_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/api/serviceusage/v1/serviceusage.proto", :syntax => :proto3) do
    add_message "google.api.serviceusage.v1.EnableServiceRequest" do
      optional :name, :string, 1
    end
    add_message "google.api.serviceusage.v1.EnableServiceResponse" do
      optional :service, :message, 1, "google.api.serviceusage.v1.Service"
    end
    add_message "google.api.serviceusage.v1.DisableServiceRequest" do
      optional :name, :string, 1
      optional :disable_dependent_services, :bool, 2
      optional :check_if_service_has_usage, :enum, 3, "google.api.serviceusage.v1.DisableServiceRequest.CheckIfServiceHasUsage"
    end
    add_enum "google.api.serviceusage.v1.DisableServiceRequest.CheckIfServiceHasUsage" do
      value :CHECK_IF_SERVICE_HAS_USAGE_UNSPECIFIED, 0
      value :SKIP, 1
      value :CHECK, 2
    end
    add_message "google.api.serviceusage.v1.DisableServiceResponse" do
      optional :service, :message, 1, "google.api.serviceusage.v1.Service"
    end
    add_message "google.api.serviceusage.v1.GetServiceRequest" do
      optional :name, :string, 1
    end
    add_message "google.api.serviceusage.v1.ListServicesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
    end
    add_message "google.api.serviceusage.v1.ListServicesResponse" do
      repeated :services, :message, 1, "google.api.serviceusage.v1.Service"
      optional :next_page_token, :string, 2
    end
    add_message "google.api.serviceusage.v1.BatchEnableServicesRequest" do
      optional :parent, :string, 1
      repeated :service_ids, :string, 2
    end
    add_message "google.api.serviceusage.v1.BatchEnableServicesResponse" do
      repeated :services, :message, 1, "google.api.serviceusage.v1.Service"
      repeated :failures, :message, 2, "google.api.serviceusage.v1.BatchEnableServicesResponse.EnableFailure"
    end
    add_message "google.api.serviceusage.v1.BatchEnableServicesResponse.EnableFailure" do
      optional :service_id, :string, 1
      optional :error_message, :string, 2
    end
    add_message "google.api.serviceusage.v1.BatchGetServicesRequest" do
      optional :parent, :string, 1
      repeated :names, :string, 2
    end
    add_message "google.api.serviceusage.v1.BatchGetServicesResponse" do
      repeated :services, :message, 1, "google.api.serviceusage.v1.Service"
    end
  end
end

module Google
  module Cloud
    module ServiceUsage
      module V1
        EnableServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.EnableServiceRequest").msgclass
        EnableServiceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.EnableServiceResponse").msgclass
        DisableServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.DisableServiceRequest").msgclass
        DisableServiceRequest::CheckIfServiceHasUsage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.DisableServiceRequest.CheckIfServiceHasUsage").enummodule
        DisableServiceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.DisableServiceResponse").msgclass
        GetServiceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.GetServiceRequest").msgclass
        ListServicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.ListServicesRequest").msgclass
        ListServicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.ListServicesResponse").msgclass
        BatchEnableServicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.BatchEnableServicesRequest").msgclass
        BatchEnableServicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.BatchEnableServicesResponse").msgclass
        BatchEnableServicesResponse::EnableFailure = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.BatchEnableServicesResponse.EnableFailure").msgclass
        BatchGetServicesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.BatchGetServicesRequest").msgclass
        BatchGetServicesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.serviceusage.v1.BatchGetServicesResponse").msgclass
      end
    end
  end
end