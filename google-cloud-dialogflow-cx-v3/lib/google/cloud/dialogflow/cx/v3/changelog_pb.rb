# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/cx/v3/changelog.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/dialogflow/cx/v3/changelog.proto", :syntax => :proto3) do
    add_message "google.cloud.dialogflow.cx.v3.ListChangelogsRequest" do
      optional :parent, :string, 1
      optional :filter, :string, 2
      optional :page_size, :int32, 3
      optional :page_token, :string, 4
    end
    add_message "google.cloud.dialogflow.cx.v3.ListChangelogsResponse" do
      repeated :changelogs, :message, 1, "google.cloud.dialogflow.cx.v3.Changelog"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.dialogflow.cx.v3.GetChangelogRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.dialogflow.cx.v3.Changelog" do
      optional :name, :string, 1
      optional :user_email, :string, 2
      optional :display_name, :string, 7
      optional :action, :string, 11
      optional :type, :string, 8
      optional :resource, :string, 3
      optional :create_time, :message, 4, "google.protobuf.Timestamp"
    end
  end
end

module Google
  module Cloud
    module Dialogflow
      module CX
        module V3
          ListChangelogsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.cx.v3.ListChangelogsRequest").msgclass
          ListChangelogsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.cx.v3.ListChangelogsResponse").msgclass
          GetChangelogRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.cx.v3.GetChangelogRequest").msgclass
          Changelog = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.dialogflow.cx.v3.Changelog").msgclass
        end
      end
    end
  end
end