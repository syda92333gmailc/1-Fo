# Copyright 2015 Google LLC
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


require "delegate"
require "time"

module Google
  module Cloud
    module ResourceManager
      class Project
        ##
        # # Project Updater
        #
        # This object is used by Project#update when passed a block. These
        # methods are used to update the project data in a single API call.
        #
        # @example
        #   require "google/cloud/resource_manager"
        #
        #   resource_manager = Google::Cloud::ResourceManager.new
        #   project = resource_manager.project "tokyo-rain-123"
        #   project.update do |p|
        #     p.name = "My Project"
        #     p.labels["env"] = "production"
        #   end
        #
        class Updater < DelegateClass(Project)
          ##
          # Updates the user-assigned name of the project. This field is
          # optional and can remain unset.
          #
          # Allowed characters are: lowercase and uppercase letters, numbers,
          # hyphen, single-quote, double-quote, space, and exclamation point.
          #
          # @example
          #   require "google/cloud/resource_manager"
          #
          #   resource_manager = Google::Cloud::ResourceManager.new
          #   project = resource_manager.project "tokyo-rain-123"
          #   project.update do |p|
          #     p.name = "My Project"
          #   end
          #
          def name= new_name
            gapi.name = new_name
          end

          ##
          # The labels associated with this project.
          #
          # Label keys must be between 1 and 63 characters long and must conform
          # to the following regular expression:
          # `[a-z]([-a-z0-9]*[a-z0-9])?`.
          #
          # Label values must be between 0 and 63 characters long and must
          # conform to the regular expression
          # `([a-z]([-a-z0-9]*[a-z0-9])?)?`.
          #
          # No more than 256 labels can be associated with a given resource.
          # (`Hash`)
          #
          # @example
          #   require "google/cloud/resource_manager"
          #
          #   resource_manager = Google::Cloud::ResourceManager.new
          #   project = resource_manager.project "tokyo-rain-123"
          #   project.update do |p|
          #     p.labels["env"] = "production"
          #   end
          #
          def labels
            gapi.labels
          end

          ##
          # Updates the labels associated with this project.
          #
          # Label keys must be between 1 and 63 characters long and must conform
          # to the following regular expression:
          # `[a-z]([-a-z0-9]*[a-z0-9])?`.
          #
          # Label values must be between 0 and 63 characters long and must
          # conform to the regular expression
          # `([a-z]([-a-z0-9]*[a-z0-9])?)?`.
          #
          # No more than 256 labels can be associated with a given resource.
          # (`Hash`)
          #
          # @example
          #   require "google/cloud/resource_manager"
          #
          #   resource_manager = Google::Cloud::ResourceManager.new
          #   project = resource_manager.project "tokyo-rain-123"
          #   project.update do |p|
          #     p.labels = { "env" => "production" }
          #   end
          #
          def labels= new_labels
            gapi.labels = new_labels
          end

          ##
          # Updates the reference to a parent with a new Resource.
          #
          # Supported parent types include "organization" and "folder". Once
          # set, the parent can be updated but cannot be cleared.
          #
          # The end user must have the `resourcemanager.projects.create`
          # permission on the parent.
          #
          # (See {Resource} and {Manager#resource}.)
          #
          # @param [Resource] new_parent A new parent Resource.
          #
          # @example
          #   require "google/cloud/resource_manager"
          #
          #   resource_manager = Google::Cloud::ResourceManager.new
          #   project = resource_manager.project "tokyo-rain-123"
          #   folder = resource_manager.resource "folder", "1234"
          #   project.parent = folder
          #
          def parent= new_parent
            raise ArgumentError, "new_parent is required" if new_parent.nil?
            gapi.parent = new_parent.to_gapi
          end

          ##
          # @private Create an Updater object.
          def self.from_project project
            dupe_gapi = project.gapi.class.new(**project.gapi.to_h)
            dupe_project = Project.from_gapi dupe_gapi, nil # no way to update
            Updater.new dupe_project
          end
        end
      end
    end
  end
end
