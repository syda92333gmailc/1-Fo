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
        # Defines an error trace message for a ScanRun.
        # @!attribute [rw] code
        #   @return [::Google::Cloud::WebSecurityScanner::V1::ScanRunErrorTrace::Code]
        #     Output only. Indicates the error reason code.
        # @!attribute [rw] scan_config_error
        #   @return [::Google::Cloud::WebSecurityScanner::V1::ScanConfigError]
        #     Output only. If the scan encounters SCAN_CONFIG_ISSUE error, this field has the error
        #     message encountered during scan configuration validation that is performed
        #     before each scan run.
        # @!attribute [rw] most_common_http_error_code
        #   @return [::Integer]
        #     Output only. If the scan encounters TOO_MANY_HTTP_ERRORS, this field indicates the most
        #     common HTTP error code, if such is available. For example, if this code is
        #     404, the scan has encountered too many NOT_FOUND responses.
        class ScanRunErrorTrace
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Output only.
          # Defines an error reason code.
          # Next id: 8
          module Code
            # Default value is never used.
            CODE_UNSPECIFIED = 0

            # Indicates that the scan run failed due to an internal server error.
            INTERNAL_ERROR = 1

            # Indicates a scan configuration error, usually due to outdated ScanConfig
            # settings, such as starting_urls or the DNS configuration.
            SCAN_CONFIG_ISSUE = 2

            # Indicates an authentication error, usually due to outdated ScanConfig
            # authentication settings.
            AUTHENTICATION_CONFIG_ISSUE = 3

            # Indicates a scan operation timeout, usually caused by a very large site.
            TIMED_OUT_WHILE_SCANNING = 4

            # Indicates that a scan encountered excessive redirects, either to
            # authentication or some other page outside of the scan scope.
            TOO_MANY_REDIRECTS = 5

            # Indicates that a scan encountered numerous errors from the web site
            # pages. When available, most_common_http_error_code field indicates the
            # most common HTTP error code encountered during the scan.
            TOO_MANY_HTTP_ERRORS = 6
          end
        end
      end
    end
  end
end
