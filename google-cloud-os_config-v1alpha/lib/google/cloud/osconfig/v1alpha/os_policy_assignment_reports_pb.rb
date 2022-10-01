# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/osconfig/v1alpha/os_policy_assignment_reports.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/osconfig/v1alpha/os_policy_assignment_reports.proto", :syntax => :proto3) do
    add_message "google.cloud.osconfig.v1alpha.GetOSPolicyAssignmentReportRequest" do
      optional :name, :string, 1
    end
    add_message "google.cloud.osconfig.v1alpha.ListOSPolicyAssignmentReportsRequest" do
      optional :parent, :string, 1
      optional :page_size, :int32, 2
      optional :filter, :string, 3
      optional :page_token, :string, 4
    end
    add_message "google.cloud.osconfig.v1alpha.ListOSPolicyAssignmentReportsResponse" do
      repeated :os_policy_assignment_reports, :message, 1, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport"
      optional :next_page_token, :string, 2
    end
    add_message "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport" do
      optional :name, :string, 1
      optional :instance, :string, 2
      optional :os_policy_assignment, :string, 3
      repeated :os_policy_compliances, :message, 4, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance"
      optional :update_time, :message, 5, "google.protobuf.Timestamp"
      optional :last_run_id, :string, 6
    end
    add_message "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance" do
      optional :os_policy_id, :string, 1
      optional :compliance_state, :enum, 2, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.ComplianceState"
      optional :compliance_state_reason, :string, 3
      repeated :os_policy_resource_compliances, :message, 4, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance"
    end
    add_message "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance" do
      optional :os_policy_resource_id, :string, 1
      repeated :config_steps, :message, 2, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.OSPolicyResourceConfigStep"
      optional :compliance_state, :enum, 3, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.ComplianceState"
      optional :compliance_state_reason, :string, 4
      oneof :output do
        optional :exec_resource_output, :message, 5, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.ExecResourceOutput"
      end
    end
    add_message "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.OSPolicyResourceConfigStep" do
      optional :type, :enum, 1, "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.OSPolicyResourceConfigStep.Type"
      optional :error_message, :string, 2
    end
    add_enum "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.OSPolicyResourceConfigStep.Type" do
      value :TYPE_UNSPECIFIED, 0
      value :VALIDATION, 1
      value :DESIRED_STATE_CHECK, 2
      value :DESIRED_STATE_ENFORCEMENT, 3
      value :DESIRED_STATE_CHECK_POST_ENFORCEMENT, 4
    end
    add_message "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.ExecResourceOutput" do
      optional :enforcement_output, :bytes, 2
    end
    add_enum "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.ComplianceState" do
      value :UNKNOWN, 0
      value :COMPLIANT, 1
      value :NON_COMPLIANT, 2
    end
    add_enum "google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.ComplianceState" do
      value :UNKNOWN, 0
      value :COMPLIANT, 1
      value :NON_COMPLIANT, 2
    end
  end
end

module Google
  module Cloud
    module OsConfig
      module V1alpha
        GetOSPolicyAssignmentReportRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.GetOSPolicyAssignmentReportRequest").msgclass
        ListOSPolicyAssignmentReportsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.ListOSPolicyAssignmentReportsRequest").msgclass
        ListOSPolicyAssignmentReportsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.ListOSPolicyAssignmentReportsResponse").msgclass
        OSPolicyAssignmentReport = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport").msgclass
        OSPolicyAssignmentReport::OSPolicyCompliance = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance").msgclass
        OSPolicyAssignmentReport::OSPolicyCompliance::OSPolicyResourceCompliance = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance").msgclass
        OSPolicyAssignmentReport::OSPolicyCompliance::OSPolicyResourceCompliance::OSPolicyResourceConfigStep = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.OSPolicyResourceConfigStep").msgclass
        OSPolicyAssignmentReport::OSPolicyCompliance::OSPolicyResourceCompliance::OSPolicyResourceConfigStep::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.OSPolicyResourceConfigStep.Type").enummodule
        OSPolicyAssignmentReport::OSPolicyCompliance::OSPolicyResourceCompliance::ExecResourceOutput = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.ExecResourceOutput").msgclass
        OSPolicyAssignmentReport::OSPolicyCompliance::OSPolicyResourceCompliance::ComplianceState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.OSPolicyResourceCompliance.ComplianceState").enummodule
        OSPolicyAssignmentReport::OSPolicyCompliance::ComplianceState = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.osconfig.v1alpha.OSPolicyAssignmentReport.OSPolicyCompliance.ComplianceState").enummodule
      end
    end
  end
end