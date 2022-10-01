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
    module Functions
      module V2
        module FunctionService
          # Path helper methods for the FunctionService API.
          module Paths
            ##
            # Create a fully-qualified Build resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/builds/{build}`
            #
            # @param project [String]
            # @param location [String]
            # @param build [String]
            #
            # @return [::String]
            def build_path project:, location:, build:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/builds/#{build}"
            end

            ##
            # Create a fully-qualified Channel resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/channels/{channel}`
            #
            # @param project [String]
            # @param location [String]
            # @param channel [String]
            #
            # @return [::String]
            def channel_path project:, location:, channel:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/channels/#{channel}"
            end

            ##
            # Create a fully-qualified Connector resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/connectors/{connector}`
            #
            # @param project [String]
            # @param location [String]
            # @param connector [String]
            #
            # @return [::String]
            def connector_path project:, location:, connector:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/connectors/#{connector}"
            end

            ##
            # Create a fully-qualified Function resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/functions/{function}`
            #
            # @param project [String]
            # @param location [String]
            # @param function [String]
            #
            # @return [::String]
            def function_path project:, location:, function:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/functions/#{function}"
            end

            ##
            # Create a fully-qualified Location resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}`
            #
            # @param project [String]
            # @param location [String]
            #
            # @return [::String]
            def location_path project:, location:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/locations/#{location}"
            end

            ##
            # Create a fully-qualified Repository resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/repositories/{repository}`
            #
            # @param project [String]
            # @param location [String]
            # @param repository [String]
            #
            # @return [::String]
            def repository_path project:, location:, repository:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/repositories/#{repository}"
            end

            ##
            # Create a fully-qualified Service resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/services/{service}`
            #
            # @param project [String]
            # @param location [String]
            # @param service [String]
            #
            # @return [::String]
            def service_path project:, location:, service:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/services/#{service}"
            end

            ##
            # Create a fully-qualified Topic resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/topics/{topic}`
            #
            # @param project [String]
            # @param topic [String]
            #
            # @return [::String]
            def topic_path project:, topic:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"

              "projects/#{project}/topics/#{topic}"
            end

            ##
            # Create a fully-qualified Trigger resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/triggers/{trigger}`
            #
            # @param project [String]
            # @param location [String]
            # @param trigger [String]
            #
            # @return [::String]
            def trigger_path project:, location:, trigger:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/triggers/#{trigger}"
            end

            ##
            # Create a fully-qualified WorkerPool resource string.
            #
            # The resource will be in the following format:
            #
            # `projects/{project}/locations/{location}/workerPools/{worker_pool}`
            #
            # @param project [String]
            # @param location [String]
            # @param worker_pool [String]
            #
            # @return [::String]
            def worker_pool_path project:, location:, worker_pool:
              raise ::ArgumentError, "project cannot contain /" if project.to_s.include? "/"
              raise ::ArgumentError, "location cannot contain /" if location.to_s.include? "/"

              "projects/#{project}/locations/#{location}/workerPools/#{worker_pool}"
            end

            extend self
          end
        end
      end
    end
  end
end