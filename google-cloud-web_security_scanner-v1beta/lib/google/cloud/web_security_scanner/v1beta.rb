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

require "google/cloud/web_security_scanner/v1beta/web_security_scanner"
require "google/cloud/web_security_scanner/v1beta/version"

module Google
  module Cloud
    module WebSecurityScanner
      ##
      # To load this package, including all its services, and instantiate a client:
      #
      # @example
      #
      #     require "google/cloud/web_security_scanner/v1beta"
      #     client = ::Google::Cloud::WebSecurityScanner::V1beta::WebSecurityScanner::Client.new
      #
      module V1beta
      end
    end
  end
end

helper_path = ::File.join __dir__, "v1beta", "_helpers.rb"
require "google/cloud/web_security_scanner/v1beta/_helpers" if ::File.file? helper_path
