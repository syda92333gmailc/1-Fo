# frozen_string_literal: true

# Copyright 2020 Google LLC
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
        # Output only.
        # Defines a warning trace message for ScanRun. Warning traces provide customers
        # with useful information that helps make the scanning process more effective.
        # @!attribute [rw] code
        #   @return [::Google::Cloud::WebSecurityScanner::V1::ScanRunWarningTrace::Code]
        #     Output only. Indicates the warning code.
        class ScanRunWarningTrace
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Output only.
          # Defines a warning message code.
          # Next id: 6
          module Code
            # Default value is never used.
            CODE_UNSPECIFIED = 0

            # Indicates that a scan discovered an unexpectedly low number of URLs. This
            # is sometimes caused by complex navigation features or by using a single
            # URL for numerous pages.
            INSUFFICIENT_CRAWL_RESULTS = 1

            # Indicates that a scan discovered too many URLs to test, or excessive
            # redundant URLs.
            TOO_MANY_CRAWL_RESULTS = 2

            # Indicates that too many tests have been generated for the scan. Customer
            # should try reducing the number of starting URLs, increasing the QPS rate,
            # or narrowing down the scope of the scan using the excluded patterns.
            TOO_MANY_FUZZ_TASKS = 3

            # Indicates that a scan is blocked by IAP.
            BLOCKED_BY_IAP = 4

            # Indicates that no seeds is found for a scan
            NO_STARTING_URL_FOUND_FOR_MANAGED_SCAN = 5
          end
        end
      end
    end
  end
end
