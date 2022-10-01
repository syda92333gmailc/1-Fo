# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/notebooks/v1beta1/instance.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/notebooks/v1beta1/environment_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/notebooks/v1beta1/instance.proto", :syntax => :proto3) do
    add_message "google.cloud.notebooks.v1beta1.Instance" do
      optional :name, :string, 1
      optional :post_startup_script, :string, 4
      optional :proxy_uri, :string, 5
      repeated :instance_owners, :string, 6
      optional :service_account, :string, 7
      optional :machine_type, :string, 8
      optional :accelerator_config, :message, 9, "google.cloud.notebooks.v1beta1.Instance.AcceleratorConfig"
      optional :state, :enum, 10, "google.cloud.notebooks.v1beta1.Instance.State"
      optional :install_gpu_driver, :bool, 11
      optional :custom_gpu_driver_path, :string, 12
      optional :boot_disk_type, :enum, 13, "google.cloud.notebooks.v1beta1.Instance.DiskType"
      optional :boot_disk_size_gb, :int64, 14
      optional :data_disk_type, :enum, 25, "google.cloud.notebooks.v1beta1.Instance.DiskType"
      optional :data_disk_size_gb, :int64, 26
      optional :no_remove_data_disk, :bool, 27
      optional :disk_encryption, :enum, 15, "google.cloud.notebooks.v1beta1.Instance.DiskEncryption"
      optional :kms_key, :string, 16
      optional :no_public_ip, :bool, 17
      optional :no_proxy_access, :bool, 18
      optional :network, :string, 19
      optional :subnet, :string, 20
      map :labels, :string, :string, 21
      map :metadata, :string, :string, 22
      optional :create_time, :message, 23, "google.protobuf.Timestamp"
      optional :update_time, :message, 24, "google.protobuf.Timestamp"
      oneof :environment do
        optional :vm_image, :message, 2, "google.cloud.notebooks.v1beta1.VmImage"
        optional :container_image, :message, 3, "google.cloud.notebooks.v1beta1.ContainerImage"
      end
    end
    add_message "google.cloud.notebooks.v1beta1.Instance.AcceleratorConfig" do
      optional :type, :enum, 1, "google.cloud.notebooks.v1beta1.Instance.AcceleratorType"
      optional :core_count, :int64, 2
    end
    add_enum "google.cloud.notebooks.v1beta1.Instance.AcceleratorType" do
      value :ACCELERATOR_TYPE_UNSPECIFIED, 0
      value :NVIDIA_TESLA_K80, 1
      value :NVIDIA_TESLA_P100, 2
      value :NVIDIA_TESLA_V100, 3
      value :NVIDIA_TESLA_P4, 4
      value :NVIDIA_TESLA_T4, 5
      value :NVIDIA_TESLA_T4_VWS, 8
      value :NVIDIA_TESLA_P100_VWS, 9
      value :NVIDIA_TESLA_P4_VWS, 10
      value :TPU_V2, 6
      value :TPU_V3, 7
    end
    add_enum "google.cloud.notebooks.v1beta1.Instance.State" do
      value :STATE_UNSPECIFIED, 0
      value :STARTING, 1
      value :PROVISIONING, 2
      value :ACTIVE, 3
      value :STOPPING, 4
      value :STOPPED, 5
      value :DELETED, 6
      value :UPGRADING, 7
      value :INITIALIZING, 8
      value :REGISTERING, 9
    end
    add_enum "google.cloud.notebooks.v1beta1.Instance.DiskType" do
      value :DISK_TYPE_UNSPECIFIED, 0
      value :PD_STANDARD, 1
      value :PD_SSD, 2
      value :PD_BALANCED, 3
    end
    add_enum "google.cloud.notebooks.v1beta1.Instance.DiskEncryption" do
      value :DISK_ENCRYPTION_UNSPECIFIED, 0
      value :GMEK, 1
      value :CMEK, 2
    end
  end
end

module Google
  module Cloud
    module Notebooks
      module V1beta1
        Instance = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.notebooks.v1beta1.Instance").msgclass
        Instance::AcceleratorConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.notebooks.v1beta1.Instance.AcceleratorConfig").msgclass
        Instance::AcceleratorType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.notebooks.v1beta1.Instance.AcceleratorType").enummodule
        Instance::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.notebooks.v1beta1.Instance.State").enummodule
        Instance::DiskType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.notebooks.v1beta1.Instance.DiskType").enummodule
        Instance::DiskEncryption = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.notebooks.v1beta1.Instance.DiskEncryption").enummodule
      end
    end
  end
end
