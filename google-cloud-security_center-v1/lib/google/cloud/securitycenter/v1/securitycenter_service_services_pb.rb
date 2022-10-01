# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/securitycenter/v1/securitycenter_service.proto for package 'Google.Cloud.SecurityCenter.V1'
# Original file comments:
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/cloud/securitycenter/v1/securitycenter_service_pb'

module Google
  module Cloud
    module SecurityCenter
      module V1
        module SecurityCenter
          # V1 APIs for Security Center service.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.securitycenter.v1.SecurityCenter'

            # Kicks off an LRO to bulk mute findings for a parent based on a filter. The
            # parent can be either an organization, folder or project. The findings
            # matched by the filter will be muted after the LRO is done.
            rpc :BulkMuteFindings, ::Google::Cloud::SecurityCenter::V1::BulkMuteFindingsRequest, ::Google::Longrunning::Operation
            # Creates a source.
            rpc :CreateSource, ::Google::Cloud::SecurityCenter::V1::CreateSourceRequest, ::Google::Cloud::SecurityCenter::V1::Source
            # Creates a finding. The corresponding source must exist for finding creation
            # to succeed.
            rpc :CreateFinding, ::Google::Cloud::SecurityCenter::V1::CreateFindingRequest, ::Google::Cloud::SecurityCenter::V1::Finding
            # Creates a mute config.
            rpc :CreateMuteConfig, ::Google::Cloud::SecurityCenter::V1::CreateMuteConfigRequest, ::Google::Cloud::SecurityCenter::V1::MuteConfig
            # Creates a notification config.
            rpc :CreateNotificationConfig, ::Google::Cloud::SecurityCenter::V1::CreateNotificationConfigRequest, ::Google::Cloud::SecurityCenter::V1::NotificationConfig
            # Deletes an existing mute config.
            rpc :DeleteMuteConfig, ::Google::Cloud::SecurityCenter::V1::DeleteMuteConfigRequest, ::Google::Protobuf::Empty
            # Deletes a notification config.
            rpc :DeleteNotificationConfig, ::Google::Cloud::SecurityCenter::V1::DeleteNotificationConfigRequest, ::Google::Protobuf::Empty
            # Gets a big query export.
            rpc :GetBigQueryExport, ::Google::Cloud::SecurityCenter::V1::GetBigQueryExportRequest, ::Google::Cloud::SecurityCenter::V1::BigQueryExport
            # Gets the access control policy on the specified Source.
            rpc :GetIamPolicy, ::Google::Iam::V1::GetIamPolicyRequest, ::Google::Iam::V1::Policy
            # Gets a mute config.
            rpc :GetMuteConfig, ::Google::Cloud::SecurityCenter::V1::GetMuteConfigRequest, ::Google::Cloud::SecurityCenter::V1::MuteConfig
            # Gets a notification config.
            rpc :GetNotificationConfig, ::Google::Cloud::SecurityCenter::V1::GetNotificationConfigRequest, ::Google::Cloud::SecurityCenter::V1::NotificationConfig
            # Gets the settings for an organization.
            rpc :GetOrganizationSettings, ::Google::Cloud::SecurityCenter::V1::GetOrganizationSettingsRequest, ::Google::Cloud::SecurityCenter::V1::OrganizationSettings
            # Gets a source.
            rpc :GetSource, ::Google::Cloud::SecurityCenter::V1::GetSourceRequest, ::Google::Cloud::SecurityCenter::V1::Source
            # Filters an organization's assets and  groups them by their specified
            # properties.
            rpc :GroupAssets, ::Google::Cloud::SecurityCenter::V1::GroupAssetsRequest, ::Google::Cloud::SecurityCenter::V1::GroupAssetsResponse
            # Filters an organization or source's findings and  groups them by their
            # specified properties.
            #
            # To group across all sources provide a `-` as the source id.
            # Example: /v1/organizations/{organization_id}/sources/-/findings,
            # /v1/folders/{folder_id}/sources/-/findings,
            # /v1/projects/{project_id}/sources/-/findings
            rpc :GroupFindings, ::Google::Cloud::SecurityCenter::V1::GroupFindingsRequest, ::Google::Cloud::SecurityCenter::V1::GroupFindingsResponse
            # Lists an organization's assets.
            rpc :ListAssets, ::Google::Cloud::SecurityCenter::V1::ListAssetsRequest, ::Google::Cloud::SecurityCenter::V1::ListAssetsResponse
            # Lists an organization or source's findings.
            #
            # To list across all sources provide a `-` as the source id.
            # Example: /v1/organizations/{organization_id}/sources/-/findings
            rpc :ListFindings, ::Google::Cloud::SecurityCenter::V1::ListFindingsRequest, ::Google::Cloud::SecurityCenter::V1::ListFindingsResponse
            # Lists mute configs.
            rpc :ListMuteConfigs, ::Google::Cloud::SecurityCenter::V1::ListMuteConfigsRequest, ::Google::Cloud::SecurityCenter::V1::ListMuteConfigsResponse
            # Lists notification configs.
            rpc :ListNotificationConfigs, ::Google::Cloud::SecurityCenter::V1::ListNotificationConfigsRequest, ::Google::Cloud::SecurityCenter::V1::ListNotificationConfigsResponse
            # Lists all sources belonging to an organization.
            rpc :ListSources, ::Google::Cloud::SecurityCenter::V1::ListSourcesRequest, ::Google::Cloud::SecurityCenter::V1::ListSourcesResponse
            # Runs asset discovery. The discovery is tracked with a long-running
            # operation.
            #
            # This API can only be called with limited frequency for an organization. If
            # it is called too frequently the caller will receive a TOO_MANY_REQUESTS
            # error.
            rpc :RunAssetDiscovery, ::Google::Cloud::SecurityCenter::V1::RunAssetDiscoveryRequest, ::Google::Longrunning::Operation
            # Updates the state of a finding.
            rpc :SetFindingState, ::Google::Cloud::SecurityCenter::V1::SetFindingStateRequest, ::Google::Cloud::SecurityCenter::V1::Finding
            # Updates the mute state of a finding.
            rpc :SetMute, ::Google::Cloud::SecurityCenter::V1::SetMuteRequest, ::Google::Cloud::SecurityCenter::V1::Finding
            # Sets the access control policy on the specified Source.
            rpc :SetIamPolicy, ::Google::Iam::V1::SetIamPolicyRequest, ::Google::Iam::V1::Policy
            # Returns the permissions that a caller has on the specified source.
            rpc :TestIamPermissions, ::Google::Iam::V1::TestIamPermissionsRequest, ::Google::Iam::V1::TestIamPermissionsResponse
            # Updates external system. This is for a given finding.
            rpc :UpdateExternalSystem, ::Google::Cloud::SecurityCenter::V1::UpdateExternalSystemRequest, ::Google::Cloud::SecurityCenter::V1::ExternalSystem
            # Creates or updates a finding. The corresponding source must exist for a
            # finding creation to succeed.
            rpc :UpdateFinding, ::Google::Cloud::SecurityCenter::V1::UpdateFindingRequest, ::Google::Cloud::SecurityCenter::V1::Finding
            # Updates a mute config.
            rpc :UpdateMuteConfig, ::Google::Cloud::SecurityCenter::V1::UpdateMuteConfigRequest, ::Google::Cloud::SecurityCenter::V1::MuteConfig
            #
            # Updates a notification config. The following update
            # fields are allowed: description, pubsub_topic, streaming_config.filter
            rpc :UpdateNotificationConfig, ::Google::Cloud::SecurityCenter::V1::UpdateNotificationConfigRequest, ::Google::Cloud::SecurityCenter::V1::NotificationConfig
            # Updates an organization's settings.
            rpc :UpdateOrganizationSettings, ::Google::Cloud::SecurityCenter::V1::UpdateOrganizationSettingsRequest, ::Google::Cloud::SecurityCenter::V1::OrganizationSettings
            # Updates a source.
            rpc :UpdateSource, ::Google::Cloud::SecurityCenter::V1::UpdateSourceRequest, ::Google::Cloud::SecurityCenter::V1::Source
            # Updates security marks.
            rpc :UpdateSecurityMarks, ::Google::Cloud::SecurityCenter::V1::UpdateSecurityMarksRequest, ::Google::Cloud::SecurityCenter::V1::SecurityMarks
            # Creates a big query export.
            rpc :CreateBigQueryExport, ::Google::Cloud::SecurityCenter::V1::CreateBigQueryExportRequest, ::Google::Cloud::SecurityCenter::V1::BigQueryExport
            # Deletes an existing big query export.
            rpc :DeleteBigQueryExport, ::Google::Cloud::SecurityCenter::V1::DeleteBigQueryExportRequest, ::Google::Protobuf::Empty
            # Updates a BigQuery export.
            rpc :UpdateBigQueryExport, ::Google::Cloud::SecurityCenter::V1::UpdateBigQueryExportRequest, ::Google::Cloud::SecurityCenter::V1::BigQueryExport
            # Lists BigQuery exports. Note that when requesting BigQuery exports at a
            # given level all exports under that level are also returned e.g. if
            # requesting BigQuery exports under a folder, then all BigQuery exports
            # immediately under the folder plus the ones created under the projects
            # within the folder are returned.
            rpc :ListBigQueryExports, ::Google::Cloud::SecurityCenter::V1::ListBigQueryExportsRequest, ::Google::Cloud::SecurityCenter::V1::ListBigQueryExportsResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end