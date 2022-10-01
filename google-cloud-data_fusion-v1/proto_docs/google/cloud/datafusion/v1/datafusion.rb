# frozen_string_literal: true

# Copyright 2021 Google LLC
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
    module DataFusion
      module V1
        # Network configuration for a Data Fusion instance. These configurations
        # are used for peering with the customer network. Configurations are optional
        # when a public Data Fusion instance is to be created. However, providing
        # these configurations allows several benefits, such as reduced network latency
        # while accessing the customer resources from managed Data Fusion instance
        # nodes, as well as access to the customer on-prem resources.
        # @!attribute [rw] network
        #   @return [::String]
        #     Name of the network in the customer project with which the Tenant Project
        #     will be peered for executing pipelines. In case of shared VPC where the
        #     network resides in another host project the network should specified in
        #     the form of projects/\\{host-project-id}/global/networks/\\{network}
        # @!attribute [rw] ip_allocation
        #   @return [::String]
        #     The IP range in CIDR notation to use for the managed Data Fusion instance
        #     nodes. This range must not overlap with any other ranges used in the
        #     customer network.
        class NetworkConfig
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # The Data Fusion version. This proto message stores information about certain
        # Data Fusion version, which is used for Data Fusion version upgrade.
        # @!attribute [rw] version_number
        #   @return [::String]
        #     The version number of the Data Fusion instance, such as '6.0.1.0'.
        # @!attribute [rw] default_version
        #   @return [::Boolean]
        #     Whether this is currently the default version for Cloud Data Fusion
        # @!attribute [rw] available_features
        #   @return [::Array<::String>]
        #     Represents a list of available feature names for a given version.
        # @!attribute [rw] type
        #   @return [::Google::Cloud::DataFusion::V1::Version::Type]
        #     Type represents the release availability of the version
        class Version
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Each type represents the release availability of a CDF version
          module Type
            # Version does not have availability yet
            TYPE_UNSPECIFIED = 0

            # Version is under development and not considered stable
            TYPE_PREVIEW = 1

            # Version is available for public use
            TYPE_GENERAL_AVAILABILITY = 2
          end
        end

        # Identifies Data Fusion accelerators for an instance.
        # @!attribute [rw] accelerator_type
        #   @return [::Google::Cloud::DataFusion::V1::Accelerator::AcceleratorType]
        #     The type of an accelator for a CDF instance.
        # @!attribute [rw] state
        #   @return [::Google::Cloud::DataFusion::V1::Accelerator::State]
        #     The state of the accelerator
        class Accelerator
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Each type represents an Accelerator (Add-On) supported by Cloud Data Fusion
          # service.
          module AcceleratorType
            # Default value, if unspecified.
            ACCELERATOR_TYPE_UNSPECIFIED = 0

            # Change Data Capture accelerator for CDF.
            CDC = 1

            # Cloud Healthcare accelerator for CDF. This accelerator is to enable Cloud
            # Healthcare specific CDF plugins developed by Healthcare team.
            HEALTHCARE = 2

            # Contact Center AI Insights
            # This accelerator is used to enable import and export pipelines
            # custom built to streamline CCAI Insights processing.
            CCAI_INSIGHTS = 3
          end

          # Different values possible for the state of an accelerator
          module State
            # Default value, do not use
            STATE_UNSPECIFIED = 0

            # Indicates that the accelerator is enabled and available to use
            ENABLED = 1

            # Indicates that the accelerator is disabled and not available to use
            DISABLED = 2

            # Indicates that accelerator state is currently unknown.
            # Requests for enable, disable could be retried while in this state
            UNKNOWN = 3
          end
        end

        # The crypto key configuration. This field is used by the Customer-managed
        # encryption keys (CMEK) feature.
        # @!attribute [rw] key_reference
        #   @return [::String]
        #     The name of the key which is used to encrypt/decrypt customer data. For key
        #     in Cloud KMS, the key should be in the format of
        #     `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
        class CryptoKeyConfig
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Represents a Data Fusion instance.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The name of this instance is in the form of
        #     projects/\\{project}/locations/\\{location}/instances/\\{instance}.
        # @!attribute [rw] description
        #   @return [::String]
        #     A description of this instance.
        # @!attribute [rw] type
        #   @return [::Google::Cloud::DataFusion::V1::Instance::Type]
        #     Required. Instance type.
        # @!attribute [rw] enable_stackdriver_logging
        #   @return [::Boolean]
        #     Option to enable Stackdriver Logging.
        # @!attribute [rw] enable_stackdriver_monitoring
        #   @return [::Boolean]
        #     Option to enable Stackdriver Monitoring.
        # @!attribute [rw] private_instance
        #   @return [::Boolean]
        #     Specifies whether the Data Fusion instance should be private. If set to
        #     true, all Data Fusion nodes will have private IP addresses and will not be
        #     able to access the public internet.
        # @!attribute [rw] network_config
        #   @return [::Google::Cloud::DataFusion::V1::NetworkConfig]
        #     Network configuration options. These are required when a private Data
        #     Fusion instance is to be created.
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     The resource labels for instance to use to annotate any related underlying
        #     resources such as Compute Engine VMs. The character '=' is not allowed to
        #     be used within the labels.
        # @!attribute [rw] options
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Map of additional options used to configure the behavior of
        #     Data Fusion instance.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. The time the instance was created.
        # @!attribute [r] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. The time the instance was last updated.
        # @!attribute [r] state
        #   @return [::Google::Cloud::DataFusion::V1::Instance::State]
        #     Output only. The current state of this Data Fusion instance.
        # @!attribute [r] state_message
        #   @return [::String]
        #     Output only. Additional information about the current state of this Data
        #     Fusion instance if available.
        # @!attribute [r] service_endpoint
        #   @return [::String]
        #     Output only. Endpoint on which the Data Fusion UI is accessible.
        # @!attribute [rw] zone
        #   @return [::String]
        #     Name of the zone in which the Data Fusion instance will be created. Only
        #     DEVELOPER instances use this field.
        # @!attribute [rw] version
        #   @return [::String]
        #     Current version of the Data Fusion. Only specifiable in Update.
        # @!attribute [r] service_account
        #   @return [::String]
        #     Output only. Deprecated. Use tenant_project_id instead to extract the tenant project ID.
        # @!attribute [rw] display_name
        #   @return [::String]
        #     Display name for an instance.
        # @!attribute [rw] available_version
        #   @return [::Array<::Google::Cloud::DataFusion::V1::Version>]
        #     Available versions that the instance can be upgraded to using
        #     UpdateInstanceRequest.
        # @!attribute [r] api_endpoint
        #   @return [::String]
        #     Output only. Endpoint on which the REST APIs is accessible.
        # @!attribute [r] gcs_bucket
        #   @return [::String]
        #     Output only. Cloud Storage bucket generated by Data Fusion in the customer project.
        # @!attribute [rw] accelerators
        #   @return [::Array<::Google::Cloud::DataFusion::V1::Accelerator>]
        #     List of accelerators enabled for this CDF instance.
        # @!attribute [r] p4_service_account
        #   @return [::String]
        #     Output only. P4 service account for the customer project.
        # @!attribute [r] tenant_project_id
        #   @return [::String]
        #     Output only. The name of the tenant project.
        # @!attribute [rw] dataproc_service_account
        #   @return [::String]
        #     User-managed service account to set on Dataproc when Cloud Data Fusion
        #     creates Dataproc to run data processing pipelines.
        #
        #     This allows users to have fine-grained access control on Dataproc's
        #     accesses to cloud resources.
        # @!attribute [rw] enable_rbac
        #   @return [::Boolean]
        #     Option to enable granular role-based access control.
        # @!attribute [rw] crypto_key_config
        #   @return [::Google::Cloud::DataFusion::V1::CryptoKeyConfig]
        #     The crypto key configuration. This field is used by the Customer-Managed
        #     Encryption Keys (CMEK) feature.
        # @!attribute [r] disabled_reason
        #   @return [::Array<::Google::Cloud::DataFusion::V1::Instance::DisabledReason>]
        #     Output only. If the instance state is DISABLED, the reason for disabling the instance.
        class Instance
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class LabelsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class OptionsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Represents the type of Data Fusion instance. Each type is configured with
          # the default settings for processing and memory.
          module Type
            # No type specified. The instance creation will fail.
            TYPE_UNSPECIFIED = 0

            # Basic Data Fusion instance. In Basic type, the user will be able to
            # create data pipelines using point and click UI. However, there are
            # certain limitations, such as fewer number of concurrent pipelines, no
            # support for streaming pipelines, etc.
            BASIC = 1

            # Enterprise Data Fusion instance. In Enterprise type, the user will have
            # all features available, such as support for streaming pipelines, higher
            # number of concurrent pipelines, etc.
            ENTERPRISE = 2

            # Developer Data Fusion instance. In Developer type, the user will have all
            # features available but with restrictive capabilities. This is to help
            # enterprises design and develop their data ingestion and integration
            # pipelines at low cost.
            DEVELOPER = 3
          end

          # Represents the state of a Data Fusion instance
          module State
            # Instance does not have a state yet
            STATE_UNSPECIFIED = 0

            # Instance is being created
            CREATING = 1

            # Instance is active and ready for requests. This corresponds to 'RUNNING'
            # in datafusion.v1beta1.
            ACTIVE = 2

            # Instance creation failed
            FAILED = 3

            # Instance is being deleted
            DELETING = 4

            # Instance is being upgraded
            UPGRADING = 5

            # Instance is being restarted
            RESTARTING = 6

            # Instance is being updated on customer request
            UPDATING = 7

            # Instance is being auto-updated
            AUTO_UPDATING = 8

            # Instance is being auto-upgraded
            AUTO_UPGRADING = 9

            # Instance is disabled
            DISABLED = 10
          end

          # The reason for disabling the instance if the state is DISABLED.
          module DisabledReason
            # This is an unknown reason for disabling.
            DISABLED_REASON_UNSPECIFIED = 0

            # The KMS key used by the instance is either revoked or denied access to
            KMS_KEY_ISSUE = 1
          end
        end

        # Request message for listing Data Fusion instances.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The project and location for which to retrieve instance information
        #     in the format projects/\\{project}/locations/\\{location}. If the location is
        #     specified as '-' (wildcard), then all regions available to the project
        #     are queried, and the results are aggregated.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     The maximum number of items to return.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     The next_page_token value to use if there are additional
        #     results to retrieve for this list request.
        # @!attribute [rw] filter
        #   @return [::String]
        #     List filter.
        # @!attribute [rw] order_by
        #   @return [::String]
        #     Sort results. Supported values are "name", "name desc",  or "" (unsorted).
        class ListInstancesRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for the list instance request.
        # @!attribute [rw] instances
        #   @return [::Array<::Google::Cloud::DataFusion::V1::Instance>]
        #     Represents a list of Data Fusion instances.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     Token to retrieve the next page of results or empty if there are no more
        #     results in the list.
        # @!attribute [rw] unreachable
        #   @return [::Array<::String>]
        #     Locations that could not be reached.
        class ListInstancesResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for the list available versions request.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The project and location for which to retrieve instance information
        #     in the format projects/\\{project}/locations/\\{location}.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     The maximum number of items to return.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     The next_page_token value to use if there are additional
        #     results to retrieve for this list request.
        # @!attribute [rw] latest_patch_only
        #   @return [::Boolean]
        #     Whether or not to return the latest patch of every available minor version.
        #     If true, only the latest patch will be returned. Ex. if allowed versions is
        #     [6.1.1, 6.1.2, 6.2.0] then response will be [6.1.2, 6.2.0]
        class ListAvailableVersionsRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for the list available versions request.
        # @!attribute [rw] available_versions
        #   @return [::Array<::Google::Cloud::DataFusion::V1::Version>]
        #     Represents a list of versions that are supported.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     Token to retrieve the next page of results or empty if there are no more
        #     results in the list.
        class ListAvailableVersionsResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for getting details about a Data Fusion instance.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The instance resource name in the format
        #     projects/\\{project}/locations/\\{location}/instances/\\{instance}.
        class GetInstanceRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for creating a Data Fusion instance.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. The instance's project and location in the format
        #     projects/\\{project}/locations/\\{location}.
        # @!attribute [rw] instance_id
        #   @return [::String]
        #     Required. The name of the instance to create.
        # @!attribute [rw] instance
        #   @return [::Google::Cloud::DataFusion::V1::Instance]
        #     An instance resource.
        class CreateInstanceRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for deleting a Data Fusion instance.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. The instance resource name in the format
        #     projects/\\{project}/locations/\\{location}/instances/\\{instance}
        class DeleteInstanceRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for updating a Data Fusion instance.
        # Data Fusion allows updating the labels, options, and stack driver settings.
        # This is also used for CDF version upgrade.
        # @!attribute [rw] instance
        #   @return [::Google::Cloud::DataFusion::V1::Instance]
        #     Required. The instance resource that replaces the resource on the server. Currently,
        #     Data Fusion only allows replacing labels, options, and stack driver
        #     settings. All other fields will be ignored.
        # @!attribute [rw] update_mask
        #   @return [::Google::Protobuf::FieldMask]
        #     Field mask is used to specify the fields that the update will overwrite
        #     in an instance resource. The fields specified in the update_mask are
        #     relative to the resource, not the full request.
        #     A field will be overwritten if it is in the mask.
        #     If the user does not provide a mask, all the supported fields (labels,
        #     options, and version currently) will be overwritten.
        class UpdateInstanceRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for restarting a Data Fusion instance.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. Name of the Data Fusion instance which need to be restarted in the form of
        #     projects/\\{project}/locations/\\{location}/instances/\\{instance}
        class RestartInstanceRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Represents the metadata of a long-running operation.
        # @!attribute [rw] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The time the operation was created.
        # @!attribute [rw] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     The time the operation finished running.
        # @!attribute [rw] target
        #   @return [::String]
        #     Server-defined resource path for the target of the operation.
        # @!attribute [rw] verb
        #   @return [::String]
        #     Name of the verb executed by the operation.
        # @!attribute [rw] status_detail
        #   @return [::String]
        #     Human-readable status of the operation if any.
        # @!attribute [rw] requested_cancellation
        #   @return [::Boolean]
        #     Identifies whether the user has requested cancellation
        #     of the operation. Operations that have successfully been cancelled
        #     have [Operation.error][] value with a {::Google::Rpc::Status#code google.rpc.Status.code} of 1,
        #     corresponding to `Code.CANCELLED`.
        # @!attribute [rw] api_version
        #   @return [::String]
        #     API version used to start the operation.
        # @!attribute [rw] additional_status
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Map to hold any additional status info for the operation
        #     If there is an accelerator being enabled/disabled/deleted, this will be
        #     populated with accelerator name as key and status as
        #     ENABLING, DISABLING or DELETING
        class OperationMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class AdditionalStatusEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end