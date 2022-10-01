# frozen_string_literal: true

# Copyright 2021 Google LLC
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

require "google/cloud/dialogflow/cx/v3/pages"
require "google/cloud/dialogflow/cx/v3/flows"
require "google/cloud/dialogflow/cx/v3/agents"
require "google/cloud/dialogflow/cx/v3/changelogs"
require "google/cloud/dialogflow/cx/v3/deployments"
require "google/cloud/dialogflow/cx/v3/entity_types"
require "google/cloud/dialogflow/cx/v3/intents"
require "google/cloud/dialogflow/cx/v3/session_entity_types"
require "google/cloud/dialogflow/cx/v3/sessions"
require "google/cloud/dialogflow/cx/v3/transition_route_groups"
require "google/cloud/dialogflow/cx/v3/test_cases"
require "google/cloud/dialogflow/cx/v3/webhooks"
require "google/cloud/dialogflow/cx/v3/environments"
require "google/cloud/dialogflow/cx/v3/experiments"
require "google/cloud/dialogflow/cx/v3/security_settings_service"
require "google/cloud/dialogflow/cx/v3/versions"
require "google/cloud/dialogflow/cx/v3/version"

module Google
  module Cloud
    module Dialogflow
      module CX
        ##
        # To load this package, including all its services, and instantiate a client:
        #
        # @example
        #
        #     require "google/cloud/dialogflow/cx/v3"
        #     client = ::Google::Cloud::Dialogflow::CX::V3::Pages::Client.new
        #
        module V3
        end
      end
    end
  end
end

helper_path = ::File.join __dir__, "v3", "_helpers.rb"
require "google/cloud/dialogflow/cx/v3/_helpers" if ::File.file? helper_path
