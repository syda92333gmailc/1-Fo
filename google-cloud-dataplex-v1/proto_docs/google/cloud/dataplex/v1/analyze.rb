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
    module Dataplex
      module V1
        # Environment represents a user-visible compute infrastructure for analytics
        # within a lake.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The relative resource name of the environment, of the form:
        #     projects/\\{project_id}/locations/\\{location_id}/lakes/\\{lake_id}/environment/\\{environment_id}
        # @!attribute [rw] display_name
        #   @return [::String]
        #     Optional. User friendly display name.
        # @!attribute [r] uid
        #   @return [::String]
        #     Output only. System generated globally unique ID for the environment. This ID will be
        #     different if the environment is deleted and re-created with the same name.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Environment creation time.
        # @!attribute [r] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. The time when the environment was last updated.
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Optional. User defined labels for the environment.
        # @!attribute [rw] description
        #   @return [::String]
        #     Optional. Description of the environment.
        # @!attribute [r] state
        #   @return [::Google::Cloud::Dataplex::V1::State]
        #     Output only. Current state of the environment.
        # @!attribute [rw] infrastructure_spec
        #   @return [::Google::Cloud::Dataplex::V1::Environment::InfrastructureSpec]
        #     Required. Infrastructure specification for the Environment.
        # @!attribute [rw] session_spec
        #   @return [::Google::Cloud::Dataplex::V1::Environment::SessionSpec]
        #     Optional. Configuration for sessions created for this environment.
        # @!attribute [r] session_status
        #   @return [::Google::Cloud::Dataplex::V1::Environment::SessionStatus]
        #     Output only. Status of sessions created for this environment.
        # @!attribute [r] endpoints
        #   @return [::Google::Cloud::Dataplex::V1::Environment::Endpoints]
        #     Output only. URI Endpoints to access sessions associated with the Environment.
        class Environment
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Configuration for the underlying infrastructure used to run workloads.
          # @!attribute [rw] compute
          #   @return [::Google::Cloud::Dataplex::V1::Environment::InfrastructureSpec::ComputeResources]
          #     Optional. Compute resources needed for analyze interactive workloads.
          # @!attribute [rw] os_image
          #   @return [::Google::Cloud::Dataplex::V1::Environment::InfrastructureSpec::OsImageRuntime]
          #     Required. Software Runtime Configuration for analyze interactive workloads.
          class InfrastructureSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Compute resources associated with the analyze interactive workloads.
            # @!attribute [rw] disk_size_gb
            #   @return [::Integer]
            #     Optional. Size in GB of the disk. Default is 100 GB.
            # @!attribute [rw] node_count
            #   @return [::Integer]
            #     Optional. Total number of nodes in the sessions created for this environment.
            # @!attribute [rw] max_node_count
            #   @return [::Integer]
            #     Optional. Max configurable nodes.
            #     If max_node_count > node_count, then auto-scaling is enabled.
            class ComputeResources
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Software Runtime Configuration to run Analyze.
            # @!attribute [rw] image_version
            #   @return [::String]
            #     Required. Dataplex Image version.
            # @!attribute [rw] java_libraries
            #   @return [::Array<::String>]
            #     Optional. List of Java jars to be included in the runtime environment.
            #     Valid input includes Cloud Storage URIs to Jar binaries.
            #     For example, gs://bucket-name/my/path/to/file.jar
            # @!attribute [rw] python_packages
            #   @return [::Array<::String>]
            #     Optional. A list of python packages to be installed.
            #     Valid formats include Cloud Storage URI to a PIP installable library.
            #     For example, gs://bucket-name/my/path/to/lib.tar.gz
            # @!attribute [rw] properties
            #   @return [::Google::Protobuf::Map{::String => ::String}]
            #     Optional. Spark properties to provide configuration for use in sessions created
            #     for this environment. The properties to set on daemon config files.
            #     Property keys are specified in `prefix:property` format.
            #     The prefix must be "spark".
            class OsImageRuntime
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods

              # @!attribute [rw] key
              #   @return [::String]
              # @!attribute [rw] value
              #   @return [::String]
              class PropertiesEntry
                include ::Google::Protobuf::MessageExts
                extend ::Google::Protobuf::MessageExts::ClassMethods
              end
            end
          end

          # @!attribute [rw] max_idle_duration
          #   @return [::Google::Protobuf::Duration]
          #     Optional. The idle time configuration of the session. The session will be
          #     auto-terminated at the end of this period.
          # @!attribute [rw] enable_fast_startup
          #   @return [::Boolean]
          #     Optional. If True, this causes sessions to be pre-created and available for faster
          #     startup to enable interactive exploration use-cases. This defaults to
          #     False to avoid additional billed charges.
          #     These can only be set to True for the environment with name set to
          #     "default", and with default configuration.
          class SessionSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [r] active
          #   @return [::Boolean]
          #     Output only. Queries over sessions to mark whether the environment is currently
          #     active or not
          class SessionStatus
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [r] notebooks
          #   @return [::String]
          #     Output only. URI to serve notebook APIs
          # @!attribute [r] sql
          #   @return [::String]
          #     Output only. URI to serve SQL APIs
          class Endpoints
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class LabelsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # Content represents a user-visible notebook or a sql script
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The relative resource name of the content, of the form:
        #     projects/\\{project_id}/locations/\\{location_id}/lakes/\\{lake_id}/content/\\{content_id}
        # @!attribute [r] uid
        #   @return [::String]
        #     Output only. System generated globally unique ID for the content. This ID will be
        #     different if the content is deleted and re-created with the same name.
        # @!attribute [rw] path
        #   @return [::String]
        #     Required. The path for the Content file, represented as directory structure.
        #     Unique within a lake.
        #     Limited to alphanumerics, hyphens, underscores, dots and slashes.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Content creation time.
        # @!attribute [r] update_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. The time when the content was last updated.
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Optional. User defined labels for the content.
        # @!attribute [rw] description
        #   @return [::String]
        #     Optional. Description of the content.
        # @!attribute [rw] data_text
        #   @return [::String]
        #     Required. Content data in string format.
        # @!attribute [rw] sql_script
        #   @return [::Google::Cloud::Dataplex::V1::Content::SqlScript]
        #     Sql Script related configurations.
        # @!attribute [rw] notebook
        #   @return [::Google::Cloud::Dataplex::V1::Content::Notebook]
        #     Notebook related configurations.
        class Content
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Configuration for the Sql Script content.
          # @!attribute [rw] engine
          #   @return [::Google::Cloud::Dataplex::V1::Content::SqlScript::QueryEngine]
          #     Required. Query Engine to be used for the Sql Query.
          class SqlScript
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Query Engine Type of the SQL Script.
            module QueryEngine
              # Value was unspecified.
              QUERY_ENGINE_UNSPECIFIED = 0

              # Spark SQL Query.
              SPARK = 2
            end
          end

          # Configuration for Notebook content.
          # @!attribute [rw] kernel_type
          #   @return [::Google::Cloud::Dataplex::V1::Content::Notebook::KernelType]
          #     Required. Kernel Type of the notebook.
          class Notebook
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Kernel Type of the Jupyter notebook.
            module KernelType
              # Kernel Type unspecified.
              KERNEL_TYPE_UNSPECIFIED = 0

              # Python 3 Kernel.
              PYTHON3 = 1
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
        end

        # Represents an active analyze session running for a user.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The relative resource name of the content, of the form:
        #     projects/\\{project_id}/locations/\\{location_id}/lakes/\\{lake_id}/environment/\\{environment_id}/sessions/\\{session_id}
        # @!attribute [r] user_id
        #   @return [::String]
        #     Output only. Email of user running the session.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Session start time.
        # @!attribute [r] state
        #   @return [::Google::Cloud::Dataplex::V1::State]
        class Session
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
