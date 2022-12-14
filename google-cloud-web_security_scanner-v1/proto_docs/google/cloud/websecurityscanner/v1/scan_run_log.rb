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
    module WebSecurityScanner
      module V1
        # A ScanRunLog is an output-only proto used for Stackdriver customer logging.
        # It is used for logs covering the start and end of scan pipelines.
        # Other than an added summary, this is a subset of the ScanRun.
        # Representation in logs is either a proto Struct, or converted to JSON.
        # Next id: 9
        # @!attribute [rw] summary
        #   @return [::String]
        #     Human friendly message about the event.
        # @!attribute [rw] name
        #   @return [::String]
        #     The resource name of the ScanRun being logged.
        # @!attribute [rw] execution_state
        #   @return [::Google::Cloud::WebSecurityScanner::V1::ScanRun::ExecutionState]
        #     The execution state of the ScanRun.
        # @!attribute [rw] result_state
        #   @return [::Google::Cloud::WebSecurityScanner::V1::ScanRun::ResultState]
        #     The result state of the ScanRun.
        # @!attribute [rw] urls_crawled_count
        #   @return [::Integer]
        # @!attribute [rw] urls_tested_count
        #   @return [::Integer]
        # @!attribute [rw] has_findings
        #   @return [::Boolean]
        # @!attribute [rw] error_trace
        #   @return [::Google::Cloud::WebSecurityScanner::V1::ScanRunErrorTrace]
        class ScanRunLog
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
