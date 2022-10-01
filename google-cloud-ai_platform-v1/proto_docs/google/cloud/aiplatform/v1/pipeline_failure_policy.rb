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
    module AIPlatform
      module V1
        # Represents the failure policy of a pipeline. Currently, the default of a
        # pipeline is that the pipeline will continue to run until no more tasks can be
        # executed, also known as PIPELINE_FAILURE_POLICY_FAIL_SLOW. However, if a
        # pipeline is set to PIPELINE_FAILURE_POLICY_FAIL_FAST, it will stop scheduling
        # any new tasks when a task has failed. Any scheduled tasks will continue to
        # completion.
        module PipelineFailurePolicy
          # Default value, and follows fail slow behavior.
          PIPELINE_FAILURE_POLICY_UNSPECIFIED = 0

          # Indicates that the pipeline should continue to run until all possible
          # tasks have been scheduled and completed.
          PIPELINE_FAILURE_POLICY_FAIL_SLOW = 1

          # Indicates that the pipeline should stop scheduling new tasks after a task
          # has failed.
          PIPELINE_FAILURE_POLICY_FAIL_FAST = 2
        end
      end
    end
  end
end