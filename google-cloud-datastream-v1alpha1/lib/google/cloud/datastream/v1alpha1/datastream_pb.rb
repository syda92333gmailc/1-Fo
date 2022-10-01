# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/datastream/v1alpha1/datastream.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/datastream/v1alpha1/datastream_resources_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/field_mask_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/datastream/v1alpha1/datastream.proto", :syntax => :proto3) do
    add_message "google.cloud.datastream.v1alpha1.DiscoverConnectionProfileRequest" do
      optional :parent, :string, 1
      oneof :target do
        optional :connection_profile, :message, 200, "google.cloud.datastream.v1alpha1.ConnectionProfile"
        optional :connection_profile_name, :string, 201
      end
      oneof :depth do
        optional :recursive, :bool, 3
        optional :recursion_depth, :int32, 4
      end
      oneof :data_object do
        optional :oracle_rdbms, :message, 100, "google.cloud.datastream.v1alpha1.OracleRdbms"
        optional :mysql_rdbms, :message, 101, "google.cloud.datastream.v1alpha1.MysqlRdbms"
      end
    end
    add_message "google.cloud.datastream.v1alpha1.DiscoverConnectionProfileResponse" do
      oneof :data_object do
        optional :oracle_rdbms, :message, 100, "google.cloud.datastream.v1alpha1.OracleRdbms"
        optional :mysql_rdbms, :message, 101, "google.cloud.datastream.v1alpha1.MysqlRdbms"
      end
    end
    add_message "google.cloud.datastream.v1alpha1.FetchStaticIpsRequest" do
      optional :name, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
    end
    add_message "google.cloud.datastream.v1alpha1.FetchStaticIpsResponse" do
      repeated :static_ips, :string, 1
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.datastream.v1alpha1.FetchErrorsRequest" do
      optional :stream, :string, 1
    end
    add_message "google.cloud.datastream.v1alpha1.FetchErrorsResponse" do
      repeated :errors, :message, 1, "google.cloud.datastream.v1alpha1.Error"
    end
    add_message "google.cloud.datastream.v1alpha1.ListConnectionProfilesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.datastream.v1alpha1.ListConnectionProfilesResponse" do
      repeated :connection_profiles, :message, 1, "google.cloud.datastream.v1alpha1.ConnectionProfile"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.datastream.v1alpha1.GetConnectionProfileRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.datastream.v1alpha1.CreateConnectionProfileRequest" do
      optional :parent, :string, 1
      optional :connection_profile_id, :string, 2
      optional :connection_profile, :message, 3, "google.cloud.datastream.v1alpha1.ConnectionProfile"
      optional :request_id, :string, 4
    end
    add_message "google.cloud.datastream.v1alpha1.UpdateConnectionProfileRequest" do
      optional :update_mask, :message, 1, "google.protobuf.FieldMask"
      optional :connection_profile, :message, 2, "google.cloud.datastream.v1alpha1.ConnectionProfile"
      optional :request_id, :string, 3
    end
    add_message "google.cloud.datastream.v1alpha1.DeleteConnectionProfileRequest" do
      optional :name, :string, 1
      optional :request_id, :string, 2
    end
    add_message "google.cloud.datastream.v1alpha1.ListStreamsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.datastream.v1alpha1.ListStreamsResponse" do
      repeated :streams, :message, 1, "google.cloud.datastream.v1alpha1.Stream"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.datastream.v1alpha1.GetStreamRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.datastream.v1alpha1.CreateStreamRequest" do
      optional :parent, :string, 1
      optional :stream_id, :string, 2
      optional :stream, :message, 3, "google.cloud.datastream.v1alpha1.Stream"
      optional :request_id, :string, 4
      optional :validate_only, :bool, 5
      optional :force, :bool, 6
    end
    add_message "google.cloud.datastream.v1alpha1.UpdateStreamRequest" do
      optional :update_mask, :message, 1, "google.protobuf.FieldMask"
      optional :stream, :message, 2, "google.cloud.datastream.v1alpha1.Stream"
      optional :request_id, :string, 3
      optional :validate_only, :bool, 4
      optional :force, :bool, 5
    end
    add_message "google.cloud.datastream.v1alpha1.DeleteStreamRequest" do
      optional :name, :string, 1
      optional :request_id, :string, 2
    end
    add_message "google.cloud.datastream.v1alpha1.OperationMetadata" do
      optional :create_time, :message, 1, "google.protobuf.Timestamp"
      optional :end_time, :message, 2, "google.protobuf.Timestamp"
      optional :target, :string, 3
      optional :verb, :string, 4
      optional :status_message, :string, 5
      optional :requested_cancellation, :bool, 6
      optional :api_version, :string, 7
      optional :validation_result, :message, 8, "google.cloud.datastream.v1alpha1.ValidationResult"
    end
    add_message "google.cloud.datastream.v1alpha1.CreatePrivateConnectionRequest" do
      optional :parent, :string, 1
      optional :private_connection_id, :string, 2
      optional :private_connection, :message, 3, "google.cloud.datastream.v1alpha1.PrivateConnection"
      optional :request_id, :string, 4
    end
    add_message "google.cloud.datastream.v1alpha1.ListPrivateConnectionsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.datastream.v1alpha1.ListPrivateConnectionsResponse" do
      repeated :private_connections, :message, 1, "google.cloud.datastream.v1alpha1.PrivateConnection"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.datastream.v1alpha1.DeletePrivateConnectionRequest" do
      optional :name, :string, 1
      optional :request_id, :string, 2
      optional :force, :bool, 3
    end
    add_message "google.cloud.datastream.v1alpha1.GetPrivateConnectionRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.datastream.v1alpha1.CreateRouteRequest" do
      optional :parent, :string, 1
      optional :route_id, :string, 2
      optional :route, :message, 3, "google.cloud.datastream.v1alpha1.Route"
      optional :request_id, :string, 4
    end
    add_message "google.cloud.datastream.v1alpha1.ListRoutesRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :page_token, :string, 3
      optional :filter, :string, 4
      optional :order_by, :string, 5
    end
    add_message "google.cloud.datastream.v1alpha1.ListRoutesResponse" do
      repeated :routes, :message, 1, "google.cloud.datastream.v1alpha1.Route"
      optional :next_page_token, :string, 2
      repeated :unreachable, :string, 3
    end
    add_message "google.cloud.datastream.v1alpha1.DeleteRouteRequest" do
      optional :name, :string, 1
      optional :request_id, :string, 2
    end
    add_message "google.cloud.datastream.v1alpha1.GetRouteRequest" do
      optional :name, :string, 1
    end
  end
end

module Google
  module Cloud
    module Datastream
      module V1alpha1
        DiscoverConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.DiscoverConnectionProfileRequest").msgclass
        DiscoverConnectionProfileResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.DiscoverConnectionProfileResponse").msgclass
        FetchStaticIpsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.FetchStaticIpsRequest").msgclass
        FetchStaticIpsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.FetchStaticIpsResponse").msgclass
        FetchErrorsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.FetchErrorsRequest").msgclass
        FetchErrorsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.FetchErrorsResponse").msgclass
        ListConnectionProfilesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListConnectionProfilesRequest").msgclass
        ListConnectionProfilesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListConnectionProfilesResponse").msgclass
        GetConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.GetConnectionProfileRequest").msgclass
        CreateConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.CreateConnectionProfileRequest").msgclass
        UpdateConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.UpdateConnectionProfileRequest").msgclass
        DeleteConnectionProfileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.DeleteConnectionProfileRequest").msgclass
        ListStreamsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListStreamsRequest").msgclass
        ListStreamsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListStreamsResponse").msgclass
        GetStreamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.GetStreamRequest").msgclass
        CreateStreamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.CreateStreamRequest").msgclass
        UpdateStreamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.UpdateStreamRequest").msgclass
        DeleteStreamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.DeleteStreamRequest").msgclass
        OperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.OperationMetadata").msgclass
        CreatePrivateConnectionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.CreatePrivateConnectionRequest").msgclass
        ListPrivateConnectionsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListPrivateConnectionsRequest").msgclass
        ListPrivateConnectionsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListPrivateConnectionsResponse").msgclass
        DeletePrivateConnectionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.DeletePrivateConnectionRequest").msgclass
        GetPrivateConnectionRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.GetPrivateConnectionRequest").msgclass
        CreateRouteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.CreateRouteRequest").msgclass
        ListRoutesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListRoutesRequest").msgclass
        ListRoutesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.ListRoutesResponse").msgclass
        DeleteRouteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.DeleteRouteRequest").msgclass
        GetRouteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.datastream.v1alpha1.GetRouteRequest").msgclass
      end
    end
  end
end