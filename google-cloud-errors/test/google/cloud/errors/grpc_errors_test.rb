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

require "helper"
require "google/cloud/errors"
require "grpc/errors"

describe Google::Cloud::Error, :grpc do
  it "identifies CanceledError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(1, "cancelled")
    _(mapped_error).must_be_kind_of Google::Cloud::CanceledError
  end

  it "identifies UnknownError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(2, "unknown")
    _(mapped_error).must_be_kind_of Google::Cloud::UnknownError
  end

  it "identifies InvalidArgumentError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(3, "invalid")
    _(mapped_error).must_be_kind_of Google::Cloud::InvalidArgumentError
  end

  it "identifies DeadlineExceededError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(4, "exceeded")
    _(mapped_error).must_be_kind_of Google::Cloud::DeadlineExceededError
  end

  it "identifies NotFoundError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(5, "not found")
    _(mapped_error).must_be_kind_of Google::Cloud::NotFoundError
  end

  it "identifies AlreadyExistsError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(6, "exists")
    _(mapped_error).must_be_kind_of Google::Cloud::AlreadyExistsError
  end

  it "identifies PermissionDeniedError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(7, "denied")
    _(mapped_error).must_be_kind_of Google::Cloud::PermissionDeniedError
  end

  it "identifies ResourceExhaustedError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(8, "exhausted")
    _(mapped_error).must_be_kind_of Google::Cloud::ResourceExhaustedError
  end

  it "identifies FailedPreconditionError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(9, "precondition")
    _(mapped_error).must_be_kind_of Google::Cloud::FailedPreconditionError
  end

  it "identifies AbortedError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(10, "aborted")
    _(mapped_error).must_be_kind_of Google::Cloud::AbortedError
  end

  it "identifies OutOfRangeError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(11, "out of range")
    _(mapped_error).must_be_kind_of Google::Cloud::OutOfRangeError
  end

  it "identifies UnimplementedError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(12, "unimplemented")
    _(mapped_error).must_be_kind_of Google::Cloud::UnimplementedError
  end

  it "identifies InternalError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(13, "internal")
    _(mapped_error).must_be_kind_of Google::Cloud::InternalError
  end

  it "identifies UnavailableError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(14, "unavailable")
    _(mapped_error).must_be_kind_of Google::Cloud::UnavailableError
  end

  it "identifies DataLossError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(15, "data loss")
    _(mapped_error).must_be_kind_of Google::Cloud::DataLossError
  end

  it "identifies UnauthenticatedError" do
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(16, "unauthenticated")
    _(mapped_error).must_be_kind_of Google::Cloud::UnauthenticatedError
  end

  it "identifies unknown error" do
    # We don't know what to map this error case to
    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(0, "unknown")
    _(mapped_error).must_be_kind_of Google::Cloud::Error

    mapped_error = Google::Cloud::Error.from_error GRPC::BadStatus.new(17, "unknown")
    _(mapped_error).must_be_kind_of Google::Cloud::Error
  end
end
