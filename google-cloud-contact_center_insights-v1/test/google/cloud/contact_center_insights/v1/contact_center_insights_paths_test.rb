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

require "helper"

require "gapic/grpc/service_stub"

require "google/cloud/contact_center_insights/v1/contact_center_insights"

class ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::ClientPathsTest < Minitest::Test
  def test_analysis_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.analysis_path project: "value0", location: "value1", conversation: "value2", analysis: "value3"
      assert_equal "projects/value0/locations/value1/conversations/value2/analyses/value3", path
    end
  end

  def test_conversation_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.conversation_path project: "value0", location: "value1", conversation: "value2"
      assert_equal "projects/value0/locations/value1/conversations/value2", path
    end
  end

  def test_issue_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.issue_path project: "value0", location: "value1", issue_model: "value2", issue: "value3"
      assert_equal "projects/value0/locations/value1/issueModels/value2/issues/value3", path
    end
  end

  def test_issue_model_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.issue_model_path project: "value0", location: "value1", issue_model: "value2"
      assert_equal "projects/value0/locations/value1/issueModels/value2", path
    end
  end

  def test_location_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.location_path project: "value0", location: "value1"
      assert_equal "projects/value0/locations/value1", path
    end
  end

  def test_participant_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.participant_path project: "value0", conversation: "value1", participant: "value2"
      assert_equal "projects/value0/conversations/value1/participants/value2", path

      path = client.participant_path project: "value0", location: "value1", conversation: "value2", participant: "value3"
      assert_equal "projects/value0/locations/value1/conversations/value2/participants/value3", path
    end
  end

  def test_phrase_matcher_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.phrase_matcher_path project: "value0", location: "value1", phrase_matcher: "value2"
      assert_equal "projects/value0/locations/value1/phraseMatchers/value2", path
    end
  end

  def test_settings_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.settings_path project: "value0", location: "value1"
      assert_equal "projects/value0/locations/value1/settings", path
    end
  end

  def test_view_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::ContactCenterInsights::V1::ContactCenterInsights::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.view_path project: "value0", location: "value1", view: "value2"
      assert_equal "projects/value0/locations/value1/views/value2", path
    end
  end
end