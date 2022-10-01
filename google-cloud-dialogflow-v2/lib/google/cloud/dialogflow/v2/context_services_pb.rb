# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/dialogflow/v2/context.proto for package 'google.cloud.dialogflow.v2'
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
require 'google/cloud/dialogflow/v2/context_pb'

module Google
  module Cloud
    module Dialogflow
      module V2
        module Contexts
          # Service for managing [Contexts][google.cloud.dialogflow.v2.Context].
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.dialogflow.v2.Contexts'

            # Returns the list of all contexts in the specified session.
            rpc :ListContexts, ::Google::Cloud::Dialogflow::V2::ListContextsRequest, ::Google::Cloud::Dialogflow::V2::ListContextsResponse
            # Retrieves the specified context.
            rpc :GetContext, ::Google::Cloud::Dialogflow::V2::GetContextRequest, ::Google::Cloud::Dialogflow::V2::Context
            # Creates a context.
            #
            # If the specified context already exists, overrides the context.
            rpc :CreateContext, ::Google::Cloud::Dialogflow::V2::CreateContextRequest, ::Google::Cloud::Dialogflow::V2::Context
            # Updates the specified context.
            rpc :UpdateContext, ::Google::Cloud::Dialogflow::V2::UpdateContextRequest, ::Google::Cloud::Dialogflow::V2::Context
            # Deletes the specified context.
            rpc :DeleteContext, ::Google::Cloud::Dialogflow::V2::DeleteContextRequest, ::Google::Protobuf::Empty
            # Deletes all active contexts in the specified session.
            rpc :DeleteAllContexts, ::Google::Cloud::Dialogflow::V2::DeleteAllContextsRequest, ::Google::Protobuf::Empty
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end