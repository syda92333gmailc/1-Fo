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
    module Monitoring
      module Dashboard
        module V1
          # A widget that displays a stream of log.
          # @!attribute [rw] filter
          #   @return [::String]
          #     A filter that chooses which log entries to return.  See [Advanced Logs
          #     Queries](https://cloud.google.com/logging/docs/view/advanced-queries).
          #     Only log entries that match the filter are returned.  An empty filter
          #     matches all log entries.
          # @!attribute [rw] resource_names
          #   @return [::Array<::String>]
          #     The names of logging resources to collect logs for. Currently only projects
          #     are supported. If empty, the widget will default to the host project.
          class LogsPanel
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end
