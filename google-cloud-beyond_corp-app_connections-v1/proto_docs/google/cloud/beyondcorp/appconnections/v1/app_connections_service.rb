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
    module BeyondCorp
      module AppConnections
        module V1
          # Request message for BeyondCorp.ListAppConnections.
          # @!attribute [rw] parent
          #   @return [::String]
          #     Required. The resource name of the AppConnection location using the form:
          #     `projects/{project_id}/locations/{location_id}`
          # @!attribute [rw] page_size
          #   @return [::Integer]
          #     Optional. The maximum number of items to return.
          #     If not specified, a default value of 50 will be used by the service.
          #     Regardless of the page_size value, the response may include a partial list
          #     and a caller should only rely on response's
          #     [next_page_token][BeyondCorp.ListAppConnectionsResponse.next_page_token] to
          #     determine if there are more instances left to be queried.
          # @!attribute [rw] page_token
          #   @return [::String]
          #     Optional. The next_page_token value returned from a previous
          #     ListAppConnectionsRequest, if any.
          # @!attribute [rw] filter
          #   @return [::String]
          #     Optional. A filter specifying constraints of a list operation.
          # @!attribute [rw] order_by
          #   @return [::String]
          #     Optional. Specifies the ordering of results. See
          #     [Sorting
          #     order](https://cloud.google.com/apis/design/design_patterns#sorting_order)
          #     for more information.
          class ListAppConnectionsRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for BeyondCorp.ListAppConnections.
          # @!attribute [rw] app_connections
          #   @return [::Array<::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection>]
          #     A list of BeyondCorp AppConnections in the project.
          # @!attribute [rw] next_page_token
          #   @return [::String]
          #     A token to retrieve the next page of results, or empty if there are no more
          #     results in the list.
          # @!attribute [rw] unreachable
          #   @return [::Array<::String>]
          #     A list of locations that could not be reached.
          class ListAppConnectionsResponse
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for BeyondCorp.GetAppConnection.
          # @!attribute [rw] name
          #   @return [::String]
          #     Required. BeyondCorp AppConnection name using the form:
          #     `projects/{project_id}/locations/{location_id}/appConnections/{app_connection_id}`
          class GetAppConnectionRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for BeyondCorp.CreateAppConnection.
          # @!attribute [rw] parent
          #   @return [::String]
          #     Required. The resource project name of the AppConnection location using the
          #     form: `projects/{project_id}/locations/{location_id}`
          # @!attribute [rw] app_connection_id
          #   @return [::String]
          #     Optional. User-settable AppConnection resource ID.
          #      * Must start with a letter.
          #      * Must contain between 4-63 characters from `/[a-z][0-9]-/`.
          #      * Must end with a number or a letter.
          # @!attribute [rw] app_connection
          #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection]
          #     Required. A BeyondCorp AppConnection resource.
          # @!attribute [rw] request_id
          #   @return [::String]
          #     Optional. An optional request ID to identify requests. Specify a unique
          #     request ID so that if you must retry your request, the server will know to
          #     ignore the request if it has already been completed. The server will
          #     guarantee that for at least 60 minutes since the first request.
          #
          #     For example, consider a situation where you make an initial request and t
          #     he request times out. If you make the request again with the same request
          #     ID, the server can check if original operation with the same request ID
          #     was received, and if so, will ignore the second request. This prevents
          #     clients from accidentally creating duplicate commitments.
          #
          #     The request ID must be a valid UUID with the exception that zero UUID is
          #     not supported (00000000-0000-0000-0000-000000000000).
          # @!attribute [rw] validate_only
          #   @return [::Boolean]
          #     Optional. If set, validates request by executing a dry-run which would not
          #     alter the resource in any way.
          class CreateAppConnectionRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for BeyondCorp.UpdateAppConnection.
          # @!attribute [rw] update_mask
          #   @return [::Google::Protobuf::FieldMask]
          #     Required. Mask of fields to update. At least one path must be supplied in
          #     this field. The elements of the repeated paths field may only include these
          #     fields from [BeyondCorp.AppConnection]:
          #     * `labels`
          #     * `display_name`
          #     * `application_endpoint`
          #     * `connectors`
          # @!attribute [rw] app_connection
          #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection]
          #     Required. AppConnection message with updated fields. Only supported fields
          #     specified in update_mask are updated.
          # @!attribute [rw] request_id
          #   @return [::String]
          #     Optional. An optional request ID to identify requests. Specify a unique
          #     request ID so that if you must retry your request, the server will know to
          #     ignore the request if it has already been completed. The server will
          #     guarantee that for at least 60 minutes since the first request.
          #
          #     For example, consider a situation where you make an initial request and t
          #     he request times out. If you make the request again with the same request
          #     ID, the server can check if original operation with the same request ID
          #     was received, and if so, will ignore the second request. This prevents
          #     clients from accidentally creating duplicate commitments.
          #
          #     The request ID must be a valid UUID with the exception that zero UUID is
          #     not supported (00000000-0000-0000-0000-000000000000).
          # @!attribute [rw] validate_only
          #   @return [::Boolean]
          #     Optional. If set, validates request by executing a dry-run which would not
          #     alter the resource in any way.
          # @!attribute [rw] allow_missing
          #   @return [::Boolean]
          #     Optional. If set as true, will create the resource if it is not found.
          class UpdateAppConnectionRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for BeyondCorp.DeleteAppConnection.
          # @!attribute [rw] name
          #   @return [::String]
          #     Required. BeyondCorp Connector name using the form:
          #     `projects/{project_id}/locations/{location_id}/appConnections/{app_connection_id}`
          # @!attribute [rw] request_id
          #   @return [::String]
          #     Optional. An optional request ID to identify requests. Specify a unique
          #     request ID so that if you must retry your request, the server will know to
          #     ignore the request if it has already been completed. The server will
          #     guarantee that for at least 60 minutes after the first request.
          #
          #     For example, consider a situation where you make an initial request and t
          #     he request times out. If you make the request again with the same request
          #     ID, the server can check if original operation with the same request ID
          #     was received, and if so, will ignore the second request. This prevents
          #     clients from accidentally creating duplicate commitments.
          #
          #     The request ID must be a valid UUID with the exception that zero UUID is
          #     not supported (00000000-0000-0000-0000-000000000000).
          # @!attribute [rw] validate_only
          #   @return [::Boolean]
          #     Optional. If set, validates request by executing a dry-run which would not
          #     alter the resource in any way.
          class DeleteAppConnectionRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Request message for BeyondCorp.ResolveAppConnections.
          # @!attribute [rw] parent
          #   @return [::String]
          #     Required. The resource name of the AppConnection location using the form:
          #     `projects/{project_id}/locations/{location_id}`
          # @!attribute [rw] app_connector_id
          #   @return [::String]
          #     Required. BeyondCorp Connector name of the connector associated with those
          #     AppConnections using the form:
          #     `projects/{project_id}/locations/{location_id}/appConnectors/{app_connector_id}`
          # @!attribute [rw] page_size
          #   @return [::Integer]
          #     Optional. The maximum number of items to return.
          #     If not specified, a default value of 50 will be used by the service.
          #     Regardless of the page_size value, the response may include a partial list
          #     and a caller should only rely on response's
          #     [next_page_token][BeyondCorp.ResolveAppConnectionsResponse.next_page_token]
          #     to determine if there are more instances left to be queried.
          # @!attribute [rw] page_token
          #   @return [::String]
          #     Optional. The next_page_token value returned from a previous
          #     ResolveAppConnectionsResponse, if any.
          class ResolveAppConnectionsRequest
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Response message for BeyondCorp.ResolveAppConnections.
          # @!attribute [rw] app_connection_details
          #   @return [::Array<::Google::Cloud::BeyondCorp::AppConnections::V1::ResolveAppConnectionsResponse::AppConnectionDetails>]
          #     A list of BeyondCorp AppConnections with details in the project.
          # @!attribute [rw] next_page_token
          #   @return [::String]
          #     A token to retrieve the next page of results, or empty if there are no more
          #     results in the list.
          # @!attribute [rw] unreachable
          #   @return [::Array<::String>]
          #     A list of locations that could not be reached.
          class ResolveAppConnectionsResponse
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Details of the AppConnection.
            # @!attribute [rw] app_connection
            #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection]
            #     A BeyondCorp AppConnection in the project.
            # @!attribute [rw] recent_mig_vms
            #   @return [::Array<::String>]
            #     If type=GCP_REGIONAL_MIG, contains most recent VM instances, like
            #     `https://www.googleapis.com/compute/v1/projects/{project_id}/zones/{zone_id}/instances/{instance_id}`.
            class AppConnectionDetails
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end

          # A BeyondCorp AppConnection resource represents a BeyondCorp protected
          # AppConnection to a remote application. It creates all the necessary GCP
          # components needed for creating a BeyondCorp protected AppConnection. Multiple
          # connectors can be authorised for a single AppConnection.
          # @!attribute [rw] name
          #   @return [::String]
          #     Required. Unique resource name of the AppConnection.
          #     The name is ignored when creating a AppConnection.
          # @!attribute [r] create_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Output only. Timestamp when the resource was created.
          # @!attribute [r] update_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Output only. Timestamp when the resource was last modified.
          # @!attribute [rw] labels
          #   @return [::Google::Protobuf::Map{::String => ::String}]
          #     Optional. Resource labels to represent user provided metadata.
          # @!attribute [rw] display_name
          #   @return [::String]
          #     Optional. An arbitrary user-provided name for the AppConnection. Cannot
          #     exceed 64 characters.
          # @!attribute [r] uid
          #   @return [::String]
          #     Output only. A unique identifier for the instance generated by the
          #     system.
          # @!attribute [rw] type
          #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection::Type]
          #     Required. The type of network connectivity used by the AppConnection.
          # @!attribute [rw] application_endpoint
          #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection::ApplicationEndpoint]
          #     Required. Address of the remote application endpoint for the BeyondCorp
          #     AppConnection.
          # @!attribute [rw] connectors
          #   @return [::Array<::String>]
          #     Optional. List of [google.cloud.beyondcorp.v1main.Connector.name] that are
          #     authorised to be associated with this AppConnection.
          # @!attribute [r] state
          #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection::State]
          #     Output only. The current state of the AppConnection.
          # @!attribute [rw] gateway
          #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection::Gateway]
          #     Optional. Gateway used by the AppConnection.
          class AppConnection
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # ApplicationEndpoint represents a remote application endpoint.
            # @!attribute [rw] host
            #   @return [::String]
            #     Required. Hostname or IP address of the remote application endpoint.
            # @!attribute [rw] port
            #   @return [::Integer]
            #     Required. Port of the remote application endpoint.
            class ApplicationEndpoint
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Gateway represents a user facing component that serves as an entrance to
            # enable connectivity.
            # @!attribute [rw] type
            #   @return [::Google::Cloud::BeyondCorp::AppConnections::V1::AppConnection::Gateway::Type]
            #     Required. The type of hosting used by the gateway.
            # @!attribute [r] uri
            #   @return [::String]
            #     Output only. Server-defined URI for this resource.
            # @!attribute [r] ingress_port
            #   @return [::Integer]
            #     Output only. Ingress port reserved on the gateways for this
            #     AppConnection, if not specified or zero, the default port is 19443.
            # @!attribute [rw] app_gateway
            #   @return [::String]
            #     Required. AppGateway name in following format:
            #     `projects/{project_id}/locations/{location_id}/appgateways/{gateway_id}`
            class Gateway
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods

              # Enum listing possible gateway hosting options.
              module Type
                # Default value. This value is unused.
                TYPE_UNSPECIFIED = 0

                # Gateway hosted in a GCP regional managed instance group.
                GCP_REGIONAL_MIG = 1
              end
            end

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::String]
            class LabelsEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Enum containing list of all possible network connectivity options
            # supported by BeyondCorp AppConnection.
            module Type
              # Default value. This value is unused.
              TYPE_UNSPECIFIED = 0

              # TCP Proxy based BeyondCorp AppConnection. API will default to this if
              # unset.
              TCP_PROXY = 1
            end

            # Represents the different states of a AppConnection.
            module State
              # Default value. This value is unused.
              STATE_UNSPECIFIED = 0

              # AppConnection is being created.
              CREATING = 1

              # AppConnection has been created.
              CREATED = 2

              # AppConnection's configuration is being updated.
              UPDATING = 3

              # AppConnection is being deleted.
              DELETING = 4

              # AppConnection is down and may be restored in the future.
              # This happens when CCFE sends ProjectState = OFF.
              DOWN = 5
            end
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
          #     have [Operation.error][] value with a
          #     {::Google::Rpc::Status#code google.rpc.Status.code} of 1, corresponding to
          #     `Code.CANCELLED`.
          # @!attribute [r] api_version
          #   @return [::String]
          #     Output only. API version used to start the operation.
          class AppConnectionOperationMetadata
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
