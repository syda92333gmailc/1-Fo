# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/devtools/artifactregistry/v1beta2/package.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/devtools/artifactregistry/v1beta2/package.proto", :syntax => :proto3) do
    add_message "google.devtools.artifactregistry.v1beta2.Package" do
      optional :name, :string, 1
      optional :display_name, :string, 2
      optional :create_time, :message, 5, "google.protobuf.Timestamp"
      optional :update_time, :message, 6, "google.protobuf.Timestamp"
    end
    add_message "google.devtools.artifactregistry.v1beta2.ListPackagesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.devtools.artifactregistry.v1beta2.ListPackagesResponse" do
      repeated :packages, :message, 1, "google.devtools.artifactregistry.v1beta2.Package"
      optional :next_page_token, :string, 2
    end
    add_message "google.devtools.artifactregistry.v1beta2.GetPackageRequest" do
      optional :name, :string, 1
    end
    add_message "google.devtools.artifactregistry.v1beta2.DeletePackageRequest" do
      optional :name, :string, 1
    end
  end
end

module Google
  module Cloud
    module ArtifactRegistry
      module V1beta2
        Package = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.Package").msgclass
        ListPackagesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.ListPackagesRequest").msgclass
        ListPackagesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.ListPackagesResponse").msgclass
        GetPackageRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.GetPackageRequest").msgclass
        DeletePackageRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.DeletePackageRequest").msgclass
      end
    end
  end
end