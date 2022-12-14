# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/retail/v2/serving_config_service.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/retail/v2/serving_config_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/retail/v2/serving_config_service.proto", :syntax => :proto3) do
    add_message "google.cloud.retail.v2.CreateServingConfigRequest" do
      optional :parent, :string, 1
      optional :serving_config, :message, 2, "google.cloud.retail.v2.ServingConfig"
      optional :serving_config_id, :string, 3
    end
    add_message "google.cloud.retail.v2.UpdateServingConfigRequest" do
      optional :serving_config, :message, 1, "google.cloud.retail.v2.ServingConfig"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
    end
    add_message "google.cloud.retail.v2.DeleteServingConfigRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.retail.v2.GetServingConfigRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.retail.v2.ListServingConfigsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.retail.v2.ListServingConfigsResponse" do
      repeated :serving_configs, :message, 1, "google.cloud.retail.v2.ServingConfig"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.retail.v2.AddControlRequest" do
      optional :serving_config, :string, 1
      optional :control_id, :string, 2
    end
    add_message "google.cloud.retail.v2.RemoveControlRequest" do
      optional :serving_config, :string, 1
      optional :control_id, :string, 2
    end
  end
end

module Google
  module Cloud
    module Retail
      module V2
        CreateServingConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.CreateServingConfigRequest").msgclass
        UpdateServingConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.UpdateServingConfigRequest").msgclass
        DeleteServingConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.DeleteServingConfigRequest").msgclass
        GetServingConfigRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.GetServingConfigRequest").msgclass
        ListServingConfigsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.ListServingConfigsRequest").msgclass
        ListServingConfigsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.ListServingConfigsResponse").msgclass
        AddControlRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.AddControlRequest").msgclass
        RemoveControlRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.RemoveControlRequest").msgclass
      end
    end
  end
end
