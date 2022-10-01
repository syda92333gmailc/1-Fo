# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/tasks/v2beta2/queue.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/tasks/v2beta2/target_pb'
require 'google/protobuf/duration_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/tasks/v2beta2/queue.proto", :syntax => :proto3) do
    add_message "google.cloud.tasks.v2beta2.Queue" do
      optional :name, :string, 1
      optional :rate_limits, :message, 5, "google.cloud.tasks.v2beta2.RateLimits"
      optional :retry_config, :message, 6, "google.cloud.tasks.v2beta2.RetryConfig"
      optional :state, :enum, 7, "google.cloud.tasks.v2beta2.Queue.State"
      optional :purge_time, :message, 8, "google.protobuf.Timestamp"
      optional :task_ttl, :message, 9, "google.protobuf.Duration"
      optional :tombstone_ttl, :message, 10, "google.protobuf.Duration"
      optional :stats, :message, 16, "google.cloud.tasks.v2beta2.QueueStats"
      oneof :target_type do
        optional :app_engine_http_target, :message, 3, "google.cloud.tasks.v2beta2.AppEngineHttpTarget"
        optional :pull_target, :message, 4, "google.cloud.tasks.v2beta2.PullTarget"
      end
    end
    add_enum "google.cloud.tasks.v2beta2.Queue.State" do
      value :STATE_UNSPECIFIED, 0
      value :RUNNING, 1
      value :PAUSED, 2
      value :DISABLED, 3
    end
    add_message "google.cloud.tasks.v2beta2.RateLimits" do
      optional :max_tasks_dispatched_per_second, :double, 1
      optional :max_burst_size, :int32, 2
      optional :max_concurrent_tasks, :int32, 3
    end
    add_message "google.cloud.tasks.v2beta2.RetryConfig" do
      optional :max_retry_duration, :message, 3, "google.protobuf.Duration"
      optional :min_backoff, :message, 4, "google.protobuf.Duration"
      optional :max_backoff, :message, 5, "google.protobuf.Duration"
      optional :max_doublings, :int32, 6
      oneof :num_attempts do
        optional :max_attempts, :int32, 1
        optional :unlimited_attempts, :bool, 2
      end
    end
    add_message "google.cloud.tasks.v2beta2.QueueStats" do
      optional :tasks_count, :int64, 1
      optional :oldest_estimated_arrival_time, :message, 2, "google.protobuf.Timestamp"
      optional :executed_last_minute_count, :int64, 3
      optional :concurrent_dispatches_count, :int64, 4
      optional :effective_execution_rate, :double, 5
    end
  end
end

module Google
  module Cloud
    module Tasks
      module V2beta2
        Queue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.tasks.v2beta2.Queue").msgclass
        Queue::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.tasks.v2beta2.Queue.State").enummodule
        RateLimits = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.tasks.v2beta2.RateLimits").msgclass
        RetryConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.tasks.v2beta2.RetryConfig").msgclass
        QueueStats = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.tasks.v2beta2.QueueStats").msgclass
      end
    end
  end
end