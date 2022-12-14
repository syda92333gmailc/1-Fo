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
    module BareMetalSolution
      module V2
        # A storage volume.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The resource name of this `Volume`.
        #     Resource names are schemeless URIs that follow the conventions in
        #     https://cloud.google.com/apis/design/resource_names.
        #     Format:
        #     `projects/{project}/locations/{location}/volumes/{volume}`
        # @!attribute [rw] id
        #   @return [::String]
        #     An identifier for the `Volume`, generated by the backend.
        # @!attribute [rw] storage_type
        #   @return [::Google::Cloud::BareMetalSolution::V2::Volume::StorageType]
        #     The storage type for this volume.
        # @!attribute [rw] state
        #   @return [::Google::Cloud::BareMetalSolution::V2::Volume::State]
        #     The state of this storage volume.
        # @!attribute [rw] requested_size_gib
        #   @return [::Integer]
        #     The requested size of this storage volume, in GiB.
        # @!attribute [rw] current_size_gib
        #   @return [::Integer]
        #     The current size of this storage volume, in GiB, including space reserved
        #     for snapshots. This size might be different than the requested size if the
        #     storage volume has been configured with auto grow or auto shrink.
        # @!attribute [rw] emergency_size_gib
        #   @return [::Integer]
        #     Additional emergency size that was requested for this Volume, in GiB.
        #     current_size_gib includes this value.
        # @!attribute [rw] auto_grown_size_gib
        #   @return [::Integer]
        #     The size, in GiB, that this storage volume has expanded as a result of an
        #     auto grow policy. In the absence of auto-grow, the value is 0.
        # @!attribute [rw] remaining_space_gib
        #   @return [::Integer]
        #     The space remaining in the storage volume for new LUNs, in GiB, excluding
        #     space reserved for snapshots.
        # @!attribute [rw] snapshot_reservation_detail
        #   @return [::Google::Cloud::BareMetalSolution::V2::Volume::SnapshotReservationDetail]
        #     Details about snapshot space reservation and usage on the storage volume.
        # @!attribute [rw] snapshot_auto_delete_behavior
        #   @return [::Google::Cloud::BareMetalSolution::V2::Volume::SnapshotAutoDeleteBehavior]
        #     The behavior to use when snapshot reserved space is full.
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Labels as key value pairs.
        # @!attribute [rw] snapshot_enabled
        #   @return [::Boolean]
        #     Whether snapshots are enabled.
        # @!attribute [rw] pod
        #   @return [::String]
        #     Immutable. Pod name.
        class Volume
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Details about snapshot space reservation and usage on the storage volume.
          # @!attribute [rw] reserved_space_gib
          #   @return [::Integer]
          #     The space on this storage volume reserved for snapshots, shown in GiB.
          # @!attribute [rw] reserved_space_used_percent
          #   @return [::Integer]
          #     The percent of snapshot space on this storage volume actually being used
          #     by the snapshot copies. This value might be higher than 100% if the
          #     snapshot copies have overflowed into the data portion of the storage
          #     volume.
          # @!attribute [rw] reserved_space_remaining_gib
          #   @return [::Integer]
          #     The amount, in GiB, of available space in this storage volume's reserved
          #     snapshot space.
          # @!attribute [rw] reserved_space_percent
          #   @return [::Integer]
          #     Percent of the total Volume size reserved for snapshot copies.
          #     Enabling snapshots requires reserving 20% or more of
          #     the storage volume space for snapshots. Maximum reserved space for
          #     snapshots is 40%.
          #     Setting this field will effectively set snapshot_enabled to true.
          class SnapshotReservationDetail
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

          # The storage type for a volume.
          module StorageType
            # The storage type for this volume is unknown.
            STORAGE_TYPE_UNSPECIFIED = 0

            # The storage type for this volume is SSD.
            SSD = 1

            # This storage type for this volume is HDD.
            HDD = 2
          end

          # The possible states for a storage volume.
          module State
            # The storage volume is in an unknown state.
            STATE_UNSPECIFIED = 0

            # The storage volume is being created.
            CREATING = 1

            # The storage volume is ready for use.
            READY = 2

            # The storage volume has been requested to be deleted.
            DELETING = 3
          end

          # The kinds of auto delete behavior to use when snapshot reserved space is
          # full.
          module SnapshotAutoDeleteBehavior
            # The unspecified behavior.
            SNAPSHOT_AUTO_DELETE_BEHAVIOR_UNSPECIFIED = 0

            # Don't delete any snapshots. This disables new snapshot creation, as
            # long as the snapshot reserved space is full.
            DISABLED = 1

            # Delete the oldest snapshots first.
            OLDEST_FIRST = 2

            # Delete the newest snapshots first.
            NEWEST_FIRST = 3
          end
        end

        # Message for requesting storage volume information.
        # @!attribute [rw] name
        #   @return [::String]
        #     Required. Name of the resource.
        class GetVolumeRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Message for requesting a list of storage volumes.
        # @!attribute [rw] parent
        #   @return [::String]
        #     Required. Parent value for ListVolumesRequest.
        # @!attribute [rw] page_size
        #   @return [::Integer]
        #     Requested page size. The server might return fewer items than requested.
        #     If unspecified, server will pick an appropriate default.
        # @!attribute [rw] page_token
        #   @return [::String]
        #     A token identifying a page of results from the server.
        # @!attribute [rw] filter
        #   @return [::String]
        #     List filter.
        class ListVolumesRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message containing the list of storage volumes.
        # @!attribute [rw] volumes
        #   @return [::Array<::Google::Cloud::BareMetalSolution::V2::Volume>]
        #     The list of storage volumes.
        # @!attribute [rw] next_page_token
        #   @return [::String]
        #     A token identifying a page of results from the server.
        # @!attribute [rw] unreachable
        #   @return [::Array<::String>]
        #     Locations that could not be reached.
        class ListVolumesResponse
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Message for updating a volume.
        # @!attribute [rw] volume
        #   @return [::Google::Cloud::BareMetalSolution::V2::Volume]
        #     Required. The volume to update.
        #
        #     The `name` field is used to identify the volume to update.
        #     Format: projects/\\{project}/locations/\\{location}/volumes/\\{volume}
        # @!attribute [rw] update_mask
        #   @return [::Google::Protobuf::FieldMask]
        #     The list of fields to update.
        #     The only currently supported fields are:
        #       `snapshot_auto_delete_behavior`
        #       `snapshot_schedule_policy_name`
        #       'labels'
        #       'snapshot_enabled'
        #       'snapshot_reservation_detail.reserved_space_percent'
        class UpdateVolumeRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for emergency resize Volume.
        # @!attribute [rw] volume
        #   @return [::String]
        #     Required. Volume to resize.
        # @!attribute [rw] size_gib
        #   @return [::Integer]
        #     New Volume size, in GiB.
        class ResizeVolumeRequest
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
