# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/resourcemanager/v3/tag_bindings.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/longrunning/operations_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/resourcemanager/v3/tag_bindings.proto", :syntax => :proto3) do
    add_message "google.cloud.resourcemanager.v3.TagBinding" do
      optional :name, :string, 1
      optional :parent, :string, 2
      optional :tag_value, :string, 3
    end
    add_message "google.cloud.resourcemanager.v3.CreateTagBindingMetadata" do
    end
    add_message "google.cloud.resourcemanager.v3.CreateTagBindingRequest" do
      optional :tag_binding, :message, 1, "google.cloud.resourcemanager.v3.TagBinding"
      optional :validate_only, :bool, 2
    end
    add_message "google.cloud.resourcemanager.v3.DeleteTagBindingMetadata" do
    end
    add_message "google.cloud.resourcemanager.v3.DeleteTagBindingRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.resourcemanager.v3.ListTagBindingsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.resourcemanager.v3.ListTagBindingsResponse" do
      repeated :tag_bindings, :message, 1, "google.cloud.resourcemanager.v3.TagBinding"
      optional :next_page_token, :string, 2
    end
  end
end

module Google
  module Cloud
    module ResourceManager
      module V3
        TagBinding = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.TagBinding").msgclass
        CreateTagBindingMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.CreateTagBindingMetadata").msgclass
        CreateTagBindingRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.CreateTagBindingRequest").msgclass
        DeleteTagBindingMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.DeleteTagBindingMetadata").msgclass
        DeleteTagBindingRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.DeleteTagBindingRequest").msgclass
        ListTagBindingsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.ListTagBindingsRequest").msgclass
        ListTagBindingsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.resourcemanager.v3.ListTagBindingsResponse").msgclass
      end
    end
  end
end