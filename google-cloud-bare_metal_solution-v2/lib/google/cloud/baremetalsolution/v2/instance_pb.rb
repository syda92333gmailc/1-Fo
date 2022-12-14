# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/baremetalsolution/v2/instance.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/baremetalsolution/v2/lun_pb'
require 'google/cloud/baremetalsolution/v2/network_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/baremetalsolution/v2/instance.proto", :syntax => :proto3) do
    add_message "google.cloud.baremetalsolution.v2.Instance" do
      optional :name, :string, 1
      optional :id, :string, 11
      optional :create_time, :message, 2, "google.protobuf.Timestamp"
      optional :update_time, :message, 3, "google.protobuf.Timestamp"
      optional :machine_type, :string, 4
      optional :state, :enum, 5, "google.cloud.baremetalsolution.v2.Instance.State"
      optional :hyperthreading_enabled, :bool, 6
      map :labels, :string, :string, 7
      repeated :luns, :message, 8, "google.cloud.baremetalsolution.v2.Lun"
      repeated :networks, :message, 9, "google.cloud.baremetalsolution.v2.Network"
      optional :interactive_serial_console_enabled, :bool, 10
      optional :os_image, :string, 12
      optional :pod, :string, 13
      optional :network_template, :string, 14
      repeated :logical_interfaces, :message, 15, "google.cloud.baremetalsolution.v2.LogicalInterface"
    end
    add_enum "google.cloud.baremetalsolution.v2.Instance.State" do
      value :STATE_UNSPECIFIED, 0
      value :PROVISIONING, 1
      value :RUNNING, 2
      value :DELETED, 3
    end
    add_message "google.cloud.baremetalsolution.v2.GetInstanceRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.baremetalsolution.v2.ListInstancesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
    end
    add_message "google.cloud.baremetalsolution.v2.ListInstancesResponse" do
      repeated :instances, :message, 1, "google.cloud.baremetalsolution.v2.Instance"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.baremetalsolution.v2.UpdateInstanceRequest" do
      optional :instance, :message, 1, "google.cloud.baremetalsolution.v2.Instance"
      optional :update_mask, :message, 2, "google.protobuf.FieldMask"
    end
    add_message "google.cloud.baremetalsolution.v2.ResetInstanceRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.baremetalsolution.v2.StartInstanceRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.baremetalsolution.v2.StopInstanceRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.baremetalsolution.v2.DetachLunRequest" do
      optional :instance, :string, 1
      optional :lun, :string, 2
    end
    add_message "google.cloud.baremetalsolution.v2.ServerNetworkTemplate" do
      optional :name, :string, 1
      repeated :applicable_instance_types, :string, 2
      repeated :logical_interfaces, :message, 3, "google.cloud.baremetalsolution.v2.ServerNetworkTemplate.LogicalInterface"
    end
    add_message "google.cloud.baremetalsolution.v2.ServerNetworkTemplate.LogicalInterface" do
      optional :name, :string, 1
      optional :type, :enum, 2, "google.cloud.baremetalsolution.v2.ServerNetworkTemplate.LogicalInterface.InterfaceType"
      optional :required, :bool, 3
    end
    add_enum "google.cloud.baremetalsolution.v2.ServerNetworkTemplate.LogicalInterface.InterfaceType" do
      value :INTERFACE_TYPE_UNSPECIFIED, 0
      value :BOND, 1
      value :NIC, 2
    end
    add_message "google.cloud.baremetalsolution.v2.StartInstanceResponse" do
    end
    add_message "google.cloud.baremetalsolution.v2.StopInstanceResponse" do
    end
  end
end

module Google
  module Cloud
    module BareMetalSolution
      module V2
        Instance = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.Instance").msgclass
        Instance::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.Instance.State").enummodule
        GetInstanceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.GetInstanceRequest").msgclass
        ListInstancesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.ListInstancesRequest").msgclass
        ListInstancesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.ListInstancesResponse").msgclass
        UpdateInstanceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.UpdateInstanceRequest").msgclass
        ResetInstanceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.ResetInstanceRequest").msgclass
        StartInstanceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.StartInstanceRequest").msgclass
        StopInstanceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.StopInstanceRequest").msgclass
        DetachLunRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.DetachLunRequest").msgclass
        ServerNetworkTemplate = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.ServerNetworkTemplate").msgclass
        ServerNetworkTemplate::LogicalInterface = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.ServerNetworkTemplate.LogicalInterface").msgclass
        ServerNetworkTemplate::LogicalInterface::InterfaceType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.ServerNetworkTemplate.LogicalInterface.InterfaceType").enummodule
        StartInstanceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.StartInstanceResponse").msgclass
        StopInstanceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.baremetalsolution.v2.StopInstanceResponse").msgclass
      end
    end
  end
end
