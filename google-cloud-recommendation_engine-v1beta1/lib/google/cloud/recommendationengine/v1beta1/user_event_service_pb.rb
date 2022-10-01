# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/recommendationengine/v1beta1/user_event_service.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/field_behavior_pb'
require 'google/api/httpbody_pb'
require 'google/api/resource_pb'
require 'google/cloud/recommendationengine/v1beta1/import_pb'
require 'google/cloud/recommendationengine/v1beta1/user_event_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/timestamp_pb'
require 'google/api/client_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/recommendationengine/v1beta1/user_event_service.proto", :syntax => :proto3) do
    add_message "google.cloud.recommendationengine.v1beta1.PurgeUserEventsRequest" do
      optional :parent, :string, 1
      optional :filter, :string, 2
      optional :force, :bool, 3
    end
    add_message "google.cloud.recommendationengine.v1beta1.PurgeUserEventsMetadata" do
      optional :operation_name, :string, 1
      optional :create_time, :message, 2, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.recommendationengine.v1beta1.PurgeUserEventsResponse" do
      optional :purged_events_count, :int64, 1
      repeated :user_events_sample, :message, 2, "google.cloud.recommendationengine.v1beta1.UserEvent"
    end
    add_message "google.cloud.recommendationengine.v1beta1.WriteUserEventRequest" do
      optional :parent, :string, 1
      optional :user_event, :message, 2, "google.cloud.recommendationengine.v1beta1.UserEvent"
    end
    add_message "google.cloud.recommendationengine.v1beta1.CollectUserEventRequest" do
      optional :parent, :string, 1
      optional :user_event, :string, 2
      optional :uri, :string, 3
      optional :ets, :int64, 4
    end
    add_message "google.cloud.recommendationengine.v1beta1.ListUserEventsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
    end
    add_message "google.cloud.recommendationengine.v1beta1.ListUserEventsResponse" do
      repeated :user_events, :message, 1, "google.cloud.recommendationengine.v1beta1.UserEvent"
      optional :next_page_token, :string, 2
    end
  end
end

module Google
  module Cloud
    module RecommendationEngine
      module V1beta1
        PurgeUserEventsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.PurgeUserEventsRequest").msgclass
        PurgeUserEventsMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.PurgeUserEventsMetadata").msgclass
        PurgeUserEventsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.PurgeUserEventsResponse").msgclass
        WriteUserEventRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.WriteUserEventRequest").msgclass
        CollectUserEventRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.CollectUserEventRequest").msgclass
        ListUserEventsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.ListUserEventsRequest").msgclass
        ListUserEventsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.recommendationengine.v1beta1.ListUserEventsResponse").msgclass
      end
    end
  end
end
