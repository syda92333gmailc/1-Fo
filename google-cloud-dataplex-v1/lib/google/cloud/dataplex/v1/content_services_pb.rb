# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/dataplex/v1/content.proto for package 'google.cloud.dataplex.v1'
# Original file comments:
# Copyright 2022 Google LLC
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
require 'google/cloud/dataplex/v1/content_pb'

module Google
  module Cloud
    module Dataplex
      module V1
        module ContentService
          # ContentService manages Notebook and SQL Scripts for Dataplex.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.dataplex.v1.ContentService'

            # Create a content.
            rpc :CreateContent, ::Google::Cloud::Dataplex::V1::CreateContentRequest, ::Google::Cloud::Dataplex::V1::Content
            # Update a content. Only supports full resource update.
            rpc :UpdateContent, ::Google::Cloud::Dataplex::V1::UpdateContentRequest, ::Google::Cloud::Dataplex::V1::Content
            # Delete a content.
            rpc :DeleteContent, ::Google::Cloud::Dataplex::V1::DeleteContentRequest, ::Google::Protobuf::Empty
            # Get a content resource.
            rpc :GetContent, ::Google::Cloud::Dataplex::V1::GetContentRequest, ::Google::Cloud::Dataplex::V1::Content
            # Gets the access control policy for a contentitem resource. A `NOT_FOUND`
            # error is returned if the resource does not exist. An empty policy is
            # returned if the resource exists but does not have a policy set on it.
            #
            # Caller must have Google IAM `dataplex.content.getIamPolicy` permission
            # on the resource.
            rpc :GetIamPolicy, ::Google::Iam::V1::GetIamPolicyRequest, ::Google::Iam::V1::Policy
            # Sets the access control policy on the specified contentitem resource.
            # Replaces any existing policy.
            #
            # Caller must have Google IAM `dataplex.content.setIamPolicy` permission
            # on the resource.
            rpc :SetIamPolicy, ::Google::Iam::V1::SetIamPolicyRequest, ::Google::Iam::V1::Policy
            # Returns the caller's permissions on a resource.
            # If the resource does not exist, an empty set of
            # permissions is returned (a `NOT_FOUND` error is not returned).
            #
            # A caller is not required to have Google IAM permission to make this
            # request.
            #
            # Note: This operation is designed to be used for building permission-aware
            # UIs and command-line tools, not for authorization checking. This operation
            # may "fail open" without warning.
            rpc :TestIamPermissions, ::Google::Iam::V1::TestIamPermissionsRequest, ::Google::Iam::V1::TestIamPermissionsResponse
            # List content.
            rpc :ListContent, ::Google::Cloud::Dataplex::V1::ListContentRequest, ::Google::Cloud::Dataplex::V1::ListContentResponse
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
