# frozen_string_literal: true

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Datastream
      module V1
        # Request message for 'discover' ConnectionProfile request.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent resource of the connection profile type. Must be in the
        #     format `projects/*/locations/*`.
        # @!attribute [rw] connection_profile
        #   @return [::Google::Cloud::Datastream::V1::ConnectionProfile]
        #     An ad-hoc connection profile configuration.
        # @!attribute [rw] connection_profile_name
        #   @return [::String]
        #     A reference to an existing connection profile.
        # @!attribute [rw] full_hierarchy
        #   @return [::Boolean]
        #     Whether to retrieve the full hierarchy of data objects (TRUE) or only the
        #     current level (FALSE).
        # @!attribute [rw] hierarchy_depth
        #   @return [::Integer]
        #     The number of hierarchy levels below the current level to be retrieved.
        # @!attribute [rw] oracle_rdbms
        #   @return [::Google::Cloud::Datastream::V1::OracleRdbms]
        #     Oracle RDBMS to enrich with child data objects and metadata.
        # @!attribute [rw] mysql_rdbms
        #   @return [::Google::Cloud::Datastream::V1::MysqlRdbms]
        #     MySQL RDBMS to enrich with child data objects and metadata.
        # @!attribute [rw] postgresql_rdbms
        #   @return [::Google::Cloud::Datastream::V1::PostgresqlRdbms]
        #     PostgreSQL RDBMS to enrich with child data objects and metadata.
        class DiscoverConnectionProfileRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response from a discover request.
        # @!attribute [rw] oracle_rdbms
        #   @return [::Google::Cloud::Datastream::V1::OracleRdbms]
        #     Enriched Oracle RDBMS object.
        # @!attribute [rw] mysql_rdbms
        #   @return [::Google::Cloud::Datastream::V1::MysqlRdbms]
        #     Enriched MySQL RDBMS object.
        # @!attribute [rw] postgresql_rdbms
        #   @return [::Google::Cloud::Datastream::V1::PostgresqlRdbms]
        #     Enriched PostgreSQL RDBMS object.
        class DiscoverConnectionProfileResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for 'FetchStaticIps' request.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The resource name for the location for which static IPs should be returned.
        #     Must be in the format `projects/*/locations/*`.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Maximum number of Ips to return, will likely not be specified.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     A page token, received from a previous `ListStaticIps` call.
        #     will likely not be specified.
        class FetchStaticIpsRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for a 'FetchStaticIps' response.
        # @!attribute [rw] static_ips
        #   @return [::Array<::String>]
        #     list of static ips by account
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token that can be sent as `page_token` to retrieve the next page.
        #     If this field is omitted, there are no subsequent pages.
        class FetchStaticIpsResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for listing connection profiles.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of connection profiles.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Maximum number of connection profiles to return.
        #     If unspecified, at most 50 connection profiles will be returned.
        #     The maximum value is 1000; values above 1000 will be coerced to 1000.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     Page token received from a previous `ListConnectionProfiles` call.
        #     Provide this to retrieve the subsequent page.
        #
        #     When paginating, all other parameters provided to `ListConnectionProfiles`
        #     must match the call that provided the page token.
        # @!attribute [rw] filter
        #   @return [::String]
        #     Filter request.
        # @!attribute [rw] order_by
        #   @return [::String]
        #     Order by fields for the result.
        class ListConnectionProfilesRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for listing connection profiles.
        # @!attribute [rw] connection_profiles
        #   @return [::Array<::Google::Cloud::Datastream::V1::ConnectionProfile>]
        #     List of connection profiles.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token, which can be sent as `page_token` to retrieve the next page.
        #     If this field is omitted, there are no subsequent pages.
        # @!attribute [rw] unreachable
        #   @return [::Array<::String>]
        #     Locations that could not be reached.
        class ListConnectionProfilesResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for getting a connection profile.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the connection profile resource to get.
        class GetConnectionProfileRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for creating a connection profile.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of ConnectionProfiles.
        # @!attribute [rw] connection_profile_id
        #   @return [::String]
        #     Required. The connection profile identifier.
        # @!attribute [rw] connection_profile
        #   @return [::Google::Cloud::Datastream::V1::ConnectionProfile]
        #     Required. The connection profile resource to create.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes since the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        # @!attribute [rw] validate_only
        #   @return [::Boolean]
        #     Optional. Only validate the connection profile, but don't create any resources.
        #     The default is false.
        # @!attribute [rw] force
        #   @return [::Boolean]
        #     Optional. Create the connection profile without validating it.
        class CreateConnectionProfileRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Connection profile update message.
        # @!attribute [rw] update_mask
        #   @return [::Google::Protobuf::FieldMask]
        #     Optional. Field mask is used to specify the fields to be overwritten in the
        #     ConnectionProfile resource by the update.
        #     The fields specified in the update_mask are relative to the resource, not
        #     the full request. A field will be overwritten if it is in the mask. If the
        #     user does not provide a mask then all fields will be overwritten.
        # @!attribute [rw] connection_profile
        #   @return [::Google::Cloud::Datastream::V1::ConnectionProfile]
        #     Required. The connection profile to update.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes since the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        # @!attribute [rw] validate_only
        #   @return [::Boolean]
        #     Optional. Only validate the connection profile, but don't update any resources.
        #     The default is false.
        # @!attribute [rw] force
        #   @return [::Boolean]
        #     Optional. Update the connection profile without validating it.
        class UpdateConnectionProfileRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for deleting a connection profile.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the connection profile resource to delete.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes after the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        class DeleteConnectionProfileRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for listing streams.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of streams.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Maximum number of streams to return.
        #     If unspecified, at most 50 streams will  be returned. The maximum
        #     value is 1000; values above 1000 will be coerced to 1000.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     Page token received from a previous `ListStreams` call.
        #     Provide this to retrieve the subsequent page.
        #
        #     When paginating, all other parameters provided to `ListStreams`
        #     must match the call that provided the page token.
        # @!attribute [rw] filter
        #   @return [::String]
        #     Filter request.
        # @!attribute [rw] order_by
        #   @return [::String]
        #     Order by fields for the result.
        class ListStreamsRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for listing streams.
        # @!attribute [rw] streams
        #   @return [::Array<::Google::Cloud::Datastream::V1::Stream>]
        #     List of streams
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token, which can be sent as `page_token` to retrieve the next page.
        #     If this field is omitted, there are no subsequent pages.
        # @!attribute [rw] unreachable
        #   @return [::Array<::String>]
        #     Locations that could not be reached.
        class ListStreamsResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for getting a stream.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the stream resource to get.
        class GetStreamRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for creating a stream.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of streams.
        # @!attribute [rw] stream_id
        #   @return [::String]
        #     Required. The stream identifier.
        # @!attribute [rw] stream
        #   @return [::Google::Cloud::Datastream::V1::Stream]
        #     Required. The stream resource to create.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes since the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        # @!attribute [rw] validate_only
        #   @return [::Boolean]
        #     Optional. Only validate the stream, but don't create any resources.
        #     The default is false.
        # @!attribute [rw] force
        #   @return [::Boolean]
        #     Optional. Create the stream without validating it.
        class CreateStreamRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for updating a stream.
        # @!attribute [rw] update_mask
        #   @return [::Google::Protobuf::FieldMask]
        #     Optional. Field mask is used to specify the fields to be overwritten in the
        #     stream resource by the update.
        #     The fields specified in the update_mask are relative to the resource, not
        #     the full request. A field will be overwritten if it is in the mask. If the
        #     user does not provide a mask then all fields will be overwritten.
        # @!attribute [rw] stream
        #   @return [::Google::Cloud::Datastream::V1::Stream]
        #     Required. The stream resource to update.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes since the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        # @!attribute [rw] validate_only
        #   @return [::Boolean]
        #     Optional. Only validate the stream with the changes, without actually updating it.
        #     The default is false.
        # @!attribute [rw] force
        #   @return [::Boolean]
        #     Optional. Update the stream without validating it.
        class UpdateStreamRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for deleting a stream.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the stream resource to delete.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes after the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        class DeleteStreamRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for fetching a specific stream object.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the stream object resource to get.
        class GetStreamObjectRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for looking up a specific stream object by its source object
        # identifier.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent stream that owns the collection of objects.
        # @!attribute [rw] source_object_identifier
        #   @return [::Google::Cloud::Datastream::V1::SourceObjectIdentifier]
        #     Required. The source object identifier which maps to the stream object.
        class LookupStreamObjectRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for manually initiating a backfill job for a specific stream object.
        # @!attribute [rw] object
        #   @return [::String]
        #     Required. The name of the stream object resource to start a backfill job for.
        class StartBackfillJobRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for manually initiating a backfill job for a specific stream object.
        # @!attribute [rw] object
        #   @return [::Google::Cloud::Datastream::V1::StreamObject]
        #     The stream object resource a backfill job was started for.
        class StartBackfillJobResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for manually stopping a running backfill job for a specific stream
        # object.
        # @!attribute [rw] object
        #   @return [::String]
        #     Required. The name of the stream object resource to stop the backfill job for.
        class StopBackfillJobRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for manually stop a backfill job for a specific stream object.
        # @!attribute [rw] object
        #   @return [::Google::Cloud::Datastream::V1::StreamObject]
        #     The stream object resource the backfill job was stopped for.
        class StopBackfillJobResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for listing all objects for a specific stream.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent stream that owns the collection of objects.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Maximum number of objects to return. Default is 50.
        #     The maximum value is 1000; values above 1000 will be coerced to 1000.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     Page token received from a previous `ListStreamObjectsRequest` call.
        #     Provide this to retrieve the subsequent page.
        #
        #     When paginating, all other parameters provided to
        #     `ListStreamObjectsRequest` must match the call that provided the page
        #     token.
        class ListStreamObjectsRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response containing the objects for a stream.
        # @!attribute [rw] stream_objects
        #   @return [::Array<::Google::Cloud::Datastream::V1::StreamObject>]
        #     List of stream objects.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token, which can be sent as `page_token` to retrieve the next page.
        class ListStreamObjectsResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Represents the metadata of the long-running operation.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. The time the operation was created.
        # @!attribute [r] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. The time the operation finished running.
        # @!attribute [r] target
        #   @return [::String]
        #     Output only. Server-defined resource path for the target of the operation.
        # @!attribute [r] verb
        #   @return [::String]
        #     Output only. Name of the verb executed by the operation.
        # @!attribute [r] status_message
        #   @return [::String]
        #     Output only. Human-readable status of the operation, if any.
        # @!attribute [r] requested_cancellation
        #   @return [::Boolean]
        #     Output only. Identifies whether the user has requested cancellation
        #     of the operation. Operations that have successfully been cancelled
        #     have [Operation.error][] value with a {::Google::Rpc::Status#code google.rpc.Status.code} of 1,
        #     corresponding to `Code.CANCELLED`.
        # @!attribute [r] api_version
        #   @return [::String]
        #     Output only. API version used to start the operation.
        # @!attribute [r] validation_result
        #   @return [::Google::Cloud::Datastream::V1::ValidationResult]
        #     Output only. Results of executed validations if there are any.
        class OperationMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for creating a private connection.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of PrivateConnections.
        # @!attribute [rw] private_connection_id
        #   @return [::String]
        #     Required. The private connectivity identifier.
        # @!attribute [rw] private_connection
        #   @return [::Google::Cloud::Datastream::V1::PrivateConnection]
        #     Required. The Private Connectivity resource to create.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes since the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        class CreatePrivateConnectionRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for listing private connections.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of private connectivity configurations.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Maximum number of private connectivity configurations to return.
        #     If unspecified, at most 50 private connectivity configurations that will be
        #     returned. The maximum value is 1000; values above 1000 will be coerced to
        #     1000.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     Page token received from a previous `ListPrivateConnections` call.
        #     Provide this to retrieve the subsequent page.
        #
        #     When paginating, all other parameters provided to
        #     `ListPrivateConnections` must match the call that provided the page
        #     token.
        # @!attribute [rw] filter
        #   @return [::String]
        #     Filter request.
        # @!attribute [rw] order_by
        #   @return [::String]
        #     Order by fields for the result.
        class ListPrivateConnectionsRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response containing a list of private connection configurations.
        # @!attribute [rw] private_connections
        #   @return [::Array<::Google::Cloud::Datastream::V1::PrivateConnection>]
        #     List of private connectivity configurations.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token, which can be sent as `page_token` to retrieve the next page.
        #     If this field is omitted, there are no subsequent pages.
        # @!attribute [rw] unreachable
        #   @return [::Array<::String>]
        #     Locations that could not be reached.
        class ListPrivateConnectionsResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request to delete a private connection.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the private connectivity configuration to delete.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes after the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        # @!attribute [rw] force
        #   @return [::Boolean]
        #     Optional. If set to true, any child routes that belong to this PrivateConnection will
        #     also be deleted.
        class DeletePrivateConnectionRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request to get a private connection configuration.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the  private connectivity configuration to get.
        class GetPrivateConnectionRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Route creation request.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of Routes.
        # @!attribute [rw] route_id
        #   @return [::String]
        #     Required. The Route identifier.
        # @!attribute [rw] route
        #   @return [::Google::Cloud::Datastream::V1::Route]
        #     Required. The Route resource to create.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes since the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        class CreateRouteRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Route list request.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The parent that owns the collection of Routess.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Maximum number of Routes to return. The service may return
        #     fewer than this value. If unspecified, at most 50 Routes
        #     will be returned. The maximum value is 1000; values above 1000 will be
        #     coerced to 1000.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     Page token received from a previous `ListRoutes` call.
        #     Provide this to retrieve the subsequent page.
        #
        #     When paginating, all other parameters provided to
        #     `ListRoutes` must match the call that provided the page
        #     token.
        # @!attribute [rw] filter
        #   @return [::String]
        #     Filter request.
        # @!attribute [rw] order_by
        #   @return [::String]
        #     Order by fields for the result.
        class ListRoutesRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Route list response.
        # @!attribute [rw] routes
        #   @return [::Array<::Google::Cloud::Datastream::V1::Route>]
        #     List of Routes.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token, which can be sent as `page_token` to retrieve the next page.
        #     If this field is omitted, there are no subsequent pages.
        # @!attribute [rw] unreachable
        #   @return [::Array<::String>]
        #     Locations that could not be reached.
        class ListRoutesResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Route deletion request.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the Route resource to delete.
        # @!attribute [rw] request_id
        #   @return [::String]
        #     Optional. A request ID to identify requests. Specify a unique request ID
        #     so that if you must retry your request, the server will know to ignore
        #     the request if it has already been completed. The server will guarantee
        #     that for at least 60 minutes after the first request.
        #
        #     For example, consider a situation where you make an initial request and the
        #     request times out. If you make the request again with the same request ID,
        #     the server can check if original operation with the same request ID was
        #     received, and if so, will ignore the second request. This prevents clients
        #     from accidentally creating duplicate commitments.
        #
        #     The request ID must be a valid UUID with the exception that zero UUID is
        #     not supported (00000000-0000-0000-0000-000000000000).
        class DeleteRouteRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Route get request.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The name of the Route resource to get.
        class GetRouteRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end