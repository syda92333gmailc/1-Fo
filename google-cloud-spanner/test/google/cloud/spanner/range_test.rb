# Copyright 2017 Google LLC
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

describe Google::Cloud::Spanner::Range do
  it "creates an inclusive range" do
    range = Google::Cloud::Spanner::Range.new 1, 100

    _(range.begin).must_equal 1
    _(range.end).must_equal 100

    _(range).wont_be :exclude_begin?
    _(range).wont_be :exclude_end?
  end

  it "creates an exclusive range" do
    range = Google::Cloud::Spanner::Range.new 1, 100, exclude_begin: true, exclude_end: true

    _(range.begin).must_equal 1
    _(range.end).must_equal 100

    _(range).must_be :exclude_begin?
    _(range).must_be :exclude_end?
  end

  it "creates a range that excludes beginning" do
    range = Google::Cloud::Spanner::Range.new 1, 100, exclude_begin: true

    _(range.begin).must_equal 1
    _(range.end).must_equal 100

    _(range).must_be :exclude_begin?
    _(range).wont_be :exclude_end?
  end

  it "creates a range that excludes ending" do
    range = Google::Cloud::Spanner::Range.new 1, 100, exclude_end: true

    _(range.begin).must_equal 1
    _(range.end).must_equal 100

    _(range).wont_be :exclude_begin?
    _(range).must_be :exclude_end?
  end
end
