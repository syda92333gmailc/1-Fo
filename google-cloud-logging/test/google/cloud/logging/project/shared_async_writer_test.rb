# Copyright 2016 Google LLC
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

describe Google::Cloud::Logging::Project, :shared_async_writer, :mock_logging do
  it "returns the same async writer object" do
    async1 = logging.shared_async_writer
    _(async1).must_be_kind_of Google::Cloud::Logging::AsyncWriter
    _(async1.logging).must_be_same_as logging
    _(async1.max_count).must_equal 10000
    _(async1.max_bytes).must_equal 10000000
    _(async1.interval).must_equal 5
    _(async1.threads).must_equal 10
    async2 = logging.shared_async_writer
    _(async2).must_be_same_as async1
  end
end
