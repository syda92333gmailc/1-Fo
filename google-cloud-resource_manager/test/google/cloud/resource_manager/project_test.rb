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

require "helper"

describe Google::Cloud::ResourceManager::Project, :mock_res_man do
  let(:seed) { 123 }
  let(:project_gapi) { random_project_gapi seed }
  let(:project) { Google::Cloud::ResourceManager::Project.from_gapi project_gapi,
                                                             resource_manager.service }

  it "knows its attributes" do
    _(project.project_id).must_equal "example-project-123"
    _(project.project_number).must_equal "123456789123"
    _(project.name).must_equal "Example Project 123"
    _(project.labels["env"]).must_equal "production"
    _(project.parent).must_be_kind_of Google::Cloud::ResourceManager::Resource
    _(project.parent.type).must_equal "folder"
    _(project.parent.id).must_equal "123"
    _(project.parent).must_be :folder?
    _(project.parent).wont_be :organization?
    _(project.created_at).must_equal Time.new(2015, 9, 1, 12, 0, 0, 0)
  end

  it "updates the name" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, "Updated Project 123"
    mock.expect :update_project, updated_project, [updated_project.project_id, updated_project]

    _(project.name).must_equal "Example Project 123"

    resource_manager.service.mocked_service = mock
    project.name = "Updated Project 123"
    mock.verify

    _(project.name).must_equal "Updated Project 123"
  end

  it "can't update labels directly" do
    expect do
      project.labels["env"] = "testing"
    end.must_raise RuntimeError # because labels is frozen
  end

  it "can update labels by setting a new hash" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, nil, { "env" => "testing" }
    mock.expect :update_project, updated_project, [updated_project.project_id, updated_project]

    _(project.labels["env"]).must_equal "production"

    resource_manager.service.mocked_service = mock
    project.labels = { "env" => "testing" }
    mock.verify

    _(project.labels["env"]).must_equal "testing"
  end

  it "can update labels by using a block" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, nil, { "env" => "testing" }
    mock.expect :update_project, updated_project, [updated_project.project_id, updated_project]

    _(project.labels["env"]).must_equal "production"

    resource_manager.service.mocked_service = mock
    project.labels do |labels|
      labels["env"] = "testing"
    end
    mock.verify

    _(project.labels["env"]).must_equal "testing"
  end

  it "does not update labels if they are not changed" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, nil, { "env" => "testing" }
    # No expect, will fail if a call is actually made.

    _(project.labels["env"]).must_equal "production"

    resource_manager.service.mocked_service = mock
    project.labels do |labels|
      labels["env"] = "production"
    end
    mock.verify

    _(project.labels["env"]).must_equal "production"
  end

  it "updates the parent" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, nil, nil, "798"
    mock.expect :update_project, updated_project, [updated_project.project_id, updated_project]

    _(project.parent).must_be_kind_of Google::Cloud::ResourceManager::Resource
    _(project.parent.type).must_equal "folder"
    _(project.parent.id).must_equal "123"
    _(project.parent).must_be :folder?
    _(project.parent).wont_be :organization?

    resource_manager.service.mocked_service = mock
    project.parent = resource_manager.resource "folder", "798"
    mock.verify

    _(project.parent).must_be_kind_of Google::Cloud::ResourceManager::Resource
    _(project.parent.type).must_equal "folder"
    _(project.parent.id).must_equal "798"
    _(project.parent).must_be :folder?
    _(project.parent).wont_be :organization?
  end

  it "can update name and labels in a single API call" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, "Updated Project 123", { "env" => "testing" }
    mock.expect :update_project, updated_project, [updated_project.project_id, updated_project]

    _(project.name).must_equal "Example Project 123"
    _(project.labels["env"]).must_equal "production"

    resource_manager.service.mocked_service = mock
    project.update do |tx|
      tx.name = "Updated Project 123"
      tx.labels["env"] = "testing"
    end
    mock.verify

    _(project.name).must_equal "Updated Project 123"
    _(project.labels["env"]).must_equal "testing"
  end

  it "can update name and override labels in a single API call" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, "Updated Project 123", { "env" => "testing" }
    mock.expect :update_project, updated_project, [updated_project.project_id, updated_project]

    _(project.name).must_equal "Example Project 123"
    _(project.labels["env"]).must_equal "production"

    resource_manager.service.mocked_service = mock
    project.update do |tx|
      tx.name = "Updated Project 123"
      tx.labels = { "env" => "testing" }
    end
    mock.verify

    _(project.name).must_equal "Updated Project 123"
    _(project.labels["env"]).must_equal "testing"
  end

  it "does not update name and labels if they are not changed" do
    mock = Minitest::Mock.new
    updated_project = random_project_gapi seed, "Updated Project 123", { "env" => "testing" }
    # No expect, will fail if a call is actually made.

    _(project.name).must_equal "Example Project 123"
    _(project.labels["env"]).must_equal "production"

    resource_manager.service.mocked_service = mock
    project.update do |tx|
      tx.name = "Example Project 123"
      tx.labels["env"] = "production"
    end
    mock.verify

    _(project.name).must_equal "Example Project 123"
    _(project.labels["env"]).must_equal "production"
  end

  it "reloads itself" do
    mock = Minitest::Mock.new
    unspecified_project = random_project_gapi seed
    unspecified_project.lifecycle_state = "LIFECYCLE_STATE_UNSPECIFIED"
    mock.expect :get_project, unspecified_project, [project.project_id]

    _(project).must_be :active?

    resource_manager.service.mocked_service = mock
    project.reload!
    mock.verify

    _(project).must_be :unspecified?
  end

  it "deletes itself" do
    mock = Minitest::Mock.new
    empty_response      = Google::Apis::CloudresourcemanagerV1::Empty.new
    deleted_project = random_project_gapi seed
    deleted_project.lifecycle_state = "DELETE_REQUESTED"
    # The delete request
    mock.expect :delete_project, empty_response,  [project.project_id]
    # The reload request
    mock.expect :get_project,    deleted_project, [project.project_id]

    _(project).must_be :active?

    resource_manager.service.mocked_service = mock
    project.delete
    mock.verify

    _(project).must_be :delete_requested?
  end

  it "undeletes itself" do
    active_project = project.gapi.dup
    # Set project to delete_requested?
    project.gapi.lifecycle_state = "DELETE_REQUESTED"

    mock = Minitest::Mock.new
    empty_response      = Google::Apis::CloudresourcemanagerV1::Empty.new
    unspecified_project = random_project_gapi seed
    unspecified_project.lifecycle_state = "LIFECYCLE_STATE_UNSPECIFIED"
    # The delete request
    mock.expect :undelete_project, empty_response, [project.project_id]
    # The reload request
    mock.expect :get_project,      active_project, [project.project_id]

    _(project).must_be :delete_requested?

    resource_manager.service.mocked_service = mock
    project.undelete
    mock.verify

    _(project).must_be :active?
  end

  describe :state do
    it "knows its state" do
      _(project.state).must_equal "ACTIVE"
      _(project).must_be :active?
      _(project).wont_be :unspecified?
      _(project).wont_be :delete_requested?
      _(project).wont_be :delete_in_progress?
    end

    describe :unspecified do
      let(:project_gapi) do
        gapi = random_project_gapi seed
        gapi.lifecycle_state = "LIFECYCLE_STATE_UNSPECIFIED"
        gapi
      end

      it "can be unspecified" do
        _(project.state).must_equal "LIFECYCLE_STATE_UNSPECIFIED"
        _(project).wont_be :active?
        _(project).must_be :unspecified?
        _(project).wont_be :delete_requested?
        _(project).wont_be :delete_in_progress?
      end
    end

    describe :delete_requested do
      let(:project_gapi) do
        gapi = random_project_gapi seed
        gapi.lifecycle_state = "DELETE_REQUESTED"
        gapi
      end

      it "can be delete_requested" do
        _(project.state).must_equal "DELETE_REQUESTED"
        _(project).wont_be :active?
        _(project).wont_be :unspecified?
        _(project).must_be :delete_requested?
        _(project).wont_be :delete_in_progress?
      end
    end

    describe :delete_in_progress do
      let(:project_gapi) do
        gapi = random_project_gapi seed
        gapi.lifecycle_state = "DELETE_IN_PROGRESS"
        gapi
      end

      it "can be DELETE_IN_PROGRESS" do
        _(project.state).must_equal "DELETE_IN_PROGRESS"
        _(project).wont_be :active?
        _(project).wont_be :unspecified?
        _(project).wont_be :delete_requested?
        _(project).must_be :delete_in_progress?
      end
    end
  end
end
