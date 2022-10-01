# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/logging/v2/logging_config.proto for package 'Google.Cloud.Logging.V2'
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
require 'google/logging/v2/logging_config_pb'

module Google
  module Cloud
    module Logging
      module V2
        module ConfigServiceV2
          # Service for configuring sinks used to route log entries.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.logging.v2.ConfigServiceV2'

            # Lists log buckets.
            rpc :ListBuckets, ::Google::Cloud::Logging::V2::ListBucketsRequest, ::Google::Cloud::Logging::V2::ListBucketsResponse
            # Gets a log bucket.
            rpc :GetBucket, ::Google::Cloud::Logging::V2::GetBucketRequest, ::Google::Cloud::Logging::V2::LogBucket
            # Creates a log bucket that can be used to store log entries. After a bucket
            # has been created, the bucket's location cannot be changed.
            rpc :CreateBucket, ::Google::Cloud::Logging::V2::CreateBucketRequest, ::Google::Cloud::Logging::V2::LogBucket
            # Updates a log bucket. This method replaces the following fields in the
            # existing bucket with values from the new bucket: `retention_period`
            #
            # If the retention period is decreased and the bucket is locked,
            # `FAILED_PRECONDITION` will be returned.
            #
            # If the bucket has a `lifecycle_state` of `DELETE_REQUESTED`, then
            # `FAILED_PRECONDITION` will be returned.
            #
            # After a bucket has been created, the bucket's location cannot be changed.
            rpc :UpdateBucket, ::Google::Cloud::Logging::V2::UpdateBucketRequest, ::Google::Cloud::Logging::V2::LogBucket
            # Deletes a log bucket.
            #
            # Changes the bucket's `lifecycle_state` to the `DELETE_REQUESTED` state.
            # After 7 days, the bucket will be purged and all log entries in the bucket
            # will be permanently deleted.
            rpc :DeleteBucket, ::Google::Cloud::Logging::V2::DeleteBucketRequest, ::Google::Protobuf::Empty
            # Undeletes a log bucket. A bucket that has been deleted can be undeleted
            # within the grace period of 7 days.
            rpc :UndeleteBucket, ::Google::Cloud::Logging::V2::UndeleteBucketRequest, ::Google::Protobuf::Empty
            # Lists views on a log bucket.
            rpc :ListViews, ::Google::Cloud::Logging::V2::ListViewsRequest, ::Google::Cloud::Logging::V2::ListViewsResponse
            # Gets a view on a log bucket..
            rpc :GetView, ::Google::Cloud::Logging::V2::GetViewRequest, ::Google::Cloud::Logging::V2::LogView
            # Creates a view over log entries in a log bucket. A bucket may contain a
            # maximum of 30 views.
            rpc :CreateView, ::Google::Cloud::Logging::V2::CreateViewRequest, ::Google::Cloud::Logging::V2::LogView
            # Updates a view on a log bucket. This method replaces the following fields
            # in the existing view with values from the new view: `filter`.
            # If an `UNAVAILABLE` error is returned, this indicates that system is not in
            # a state where it can update the view. If this occurs, please try again in a
            # few minutes.
            rpc :UpdateView, ::Google::Cloud::Logging::V2::UpdateViewRequest, ::Google::Cloud::Logging::V2::LogView
            # Deletes a view on a log bucket.
            # If an `UNAVAILABLE` error is returned, this indicates that system is not in
            # a state where it can delete the view. If this occurs, please try again in a
            # few minutes.
            rpc :DeleteView, ::Google::Cloud::Logging::V2::DeleteViewRequest, ::Google::Protobuf::Empty
            # Lists sinks.
            rpc :ListSinks, ::Google::Cloud::Logging::V2::ListSinksRequest, ::Google::Cloud::Logging::V2::ListSinksResponse
            # Gets a sink.
            rpc :GetSink, ::Google::Cloud::Logging::V2::GetSinkRequest, ::Google::Cloud::Logging::V2::LogSink
            # Creates a sink that exports specified log entries to a destination. The
            # export of newly-ingested log entries begins immediately, unless the sink's
            # `writer_identity` is not permitted to write to the destination. A sink can
            # export log entries only from the resource owning the sink.
            rpc :CreateSink, ::Google::Cloud::Logging::V2::CreateSinkRequest, ::Google::Cloud::Logging::V2::LogSink
            # Updates a sink. This method replaces the following fields in the existing
            # sink with values from the new sink: `destination`, and `filter`.
            #
            # The updated sink might also have a new `writer_identity`; see the
            # `unique_writer_identity` field.
            rpc :UpdateSink, ::Google::Cloud::Logging::V2::UpdateSinkRequest, ::Google::Cloud::Logging::V2::LogSink
            # Deletes a sink. If the sink has a unique `writer_identity`, then that
            # service account is also deleted.
            rpc :DeleteSink, ::Google::Cloud::Logging::V2::DeleteSinkRequest, ::Google::Protobuf::Empty
            # Lists all the exclusions on the _Default sink in a parent resource.
            rpc :ListExclusions, ::Google::Cloud::Logging::V2::ListExclusionsRequest, ::Google::Cloud::Logging::V2::ListExclusionsResponse
            # Gets the description of an exclusion in the _Default sink.
            rpc :GetExclusion, ::Google::Cloud::Logging::V2::GetExclusionRequest, ::Google::Cloud::Logging::V2::LogExclusion
            # Creates a new exclusion in the _Default sink in a specified parent
            # resource. Only log entries belonging to that resource can be excluded. You
            # can have up to 10 exclusions in a resource.
            rpc :CreateExclusion, ::Google::Cloud::Logging::V2::CreateExclusionRequest, ::Google::Cloud::Logging::V2::LogExclusion
            # Changes one or more properties of an existing exclusion in the _Default
            # sink.
            rpc :UpdateExclusion, ::Google::Cloud::Logging::V2::UpdateExclusionRequest, ::Google::Cloud::Logging::V2::LogExclusion
            # Deletes an exclusion in the _Default sink.
            rpc :DeleteExclusion, ::Google::Cloud::Logging::V2::DeleteExclusionRequest, ::Google::Protobuf::Empty
            # Gets the Logging CMEK settings for the given resource.
            #
            # Note: CMEK for the Log Router can be configured for Google Cloud projects,
            # folders, organizations and billing accounts. Once configured for an
            # organization, it applies to all projects and folders in the Google Cloud
            # organization.
            #
            # See [Enabling CMEK for Log
            # Router](https://cloud.google.com/logging/docs/routing/managed-encryption)
            # for more information.
            rpc :GetCmekSettings, ::Google::Cloud::Logging::V2::GetCmekSettingsRequest, ::Google::Cloud::Logging::V2::CmekSettings
            # Updates the Log Router CMEK settings for the given resource.
            #
            # Note: CMEK for the Log Router can currently only be configured for Google
            # Cloud organizations. Once configured, it applies to all projects and
            # folders in the Google Cloud organization.
            #
            # [UpdateCmekSettings][google.logging.v2.ConfigServiceV2.UpdateCmekSettings]
            # will fail if 1) `kms_key_name` is invalid, or 2) the associated service
            # account does not have the required
            # `roles/cloudkms.cryptoKeyEncrypterDecrypter` role assigned for the key, or
            # 3) access to the key is disabled.
            #
            # See [Enabling CMEK for Log
            # Router](https://cloud.google.com/logging/docs/routing/managed-encryption)
            # for more information.
            rpc :UpdateCmekSettings, ::Google::Cloud::Logging::V2::UpdateCmekSettingsRequest, ::Google::Cloud::Logging::V2::CmekSettings
            # Gets the Log Router settings for the given resource.
            #
            # Note: Settings for the Log Router can be get for Google Cloud projects,
            # folders, organizations and billing accounts. Currently it can only be
            # configured for organizations. Once configured for an organization, it
            # applies to all projects and folders in the Google Cloud organization.
            #
            # See [Enabling CMEK for Log
            # Router](https://cloud.google.com/logging/docs/routing/managed-encryption)
            # for more information.
            rpc :GetSettings, ::Google::Cloud::Logging::V2::GetSettingsRequest, ::Google::Cloud::Logging::V2::Settings
            # Updates the Log Router settings for the given resource.
            #
            # Note: Settings for the Log Router can currently only be configured for
            # Google Cloud organizations. Once configured, it applies to all projects and
            # folders in the Google Cloud organization.
            #
            # [UpdateSettings][google.logging.v2.ConfigServiceV2.UpdateSettings]
            # will fail if 1) `kms_key_name` is invalid, or 2) the associated service
            # account does not have the required
            # `roles/cloudkms.cryptoKeyEncrypterDecrypter` role assigned for the key, or
            # 3) access to the key is disabled. 4) `location_id` is not supported by
            # Logging. 5) `location_id` violate OrgPolicy.
            #
            # See [Enabling CMEK for Log
            # Router](https://cloud.google.com/logging/docs/routing/managed-encryption)
            # for more information.
            rpc :UpdateSettings, ::Google::Cloud::Logging::V2::UpdateSettingsRequest, ::Google::Cloud::Logging::V2::Settings
            # Copies a set of log entries from a log bucket to a Cloud Storage bucket.
            rpc :CopyLogEntries, ::Google::Cloud::Logging::V2::CopyLogEntriesRequest, ::Google::Longrunning::Operation
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end