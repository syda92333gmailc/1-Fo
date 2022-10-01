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

describe Google::Cloud::PubSub::Topic, :reference, :mock_pubsub do
  let(:topic_name) { "topic-name-goes-here" }
  let(:topic) { Google::Cloud::PubSub::Topic.from_grpc Google::Cloud::PubSub::V1::Topic.new(topic_hash(topic_name)), pubsub.service }

  it "will not be reference when created with an HTTP method" do
    _(topic).wont_be :reference?
    _(topic).must_be :resource?
  end

  describe "reference topic" do
    let(:topic) { Google::Cloud::PubSub::Topic.from_name topic_name, pubsub.service }

    it "will be reference when created lazily" do
      _(topic).must_be :reference?
      _(topic).wont_be :resource?
    end
  end
end
