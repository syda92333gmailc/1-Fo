# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/devtools/artifactregistry/v1beta2/settings.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/field_mask_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/devtools/artifactregistry/v1beta2/settings.proto", :syntax => :proto3) do
    add_message "google.devtools.artifactregistry.v1beta2.ProjectSettings" do
      optional :name, :string, 1
      optional :legacy_redirection_state, :enum, 2, "google.devtools.artifactregistry.v1beta2.ProjectSettings.RedirectionState"
    end
    add_enum "google.devtools.artifactregistry.v1beta2.ProjectSettings.RedirectionState" do
      value :REDIRECTION_STATE_UNSPECIFIED, 0
      value :REDIRECTION_FROM_GCR_IO_DISABLED, 1
      value :REDIRECTION_FROM_GCR_IO_ENABLED, 2
      value :REDIRECTION_FROM_GCR_IO_FINALIZED, 3
    end
    add_message "google.devtools.artifactregistry.v1beta2.GetProjectSettingsRequest" do
      optional :name, :string, 1
    end
    add_message "google.devtools.artifactregistry.v1beta2.UpdateProjectSettingsRequest" do
      optional :project_settings, :message, 2, "google.devtools.artifactregistry.v1beta2.ProjectSettings"
      optional :update_mask, :message, 3, "google.protobuf.FieldMask"
    end
  end
end

module Google
  module Cloud
    module ArtifactRegistry
      module V1beta2
        ProjectSettings = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.ProjectSettings").msgclass
        ProjectSettings::RedirectionState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.ProjectSettings.RedirectionState").enummodule
        GetProjectSettingsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.GetProjectSettingsRequest").msgclass
        UpdateProjectSettingsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.devtools.artifactregistry.v1beta2.UpdateProjectSettingsRequest").msgclass
      end
    end
  end
end
