# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/channel/v1/common.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/protobuf/any_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/channel/v1/common.proto", :syntax => :proto3) do
    add_message "google.cloud.channel.v1.EduData" do
      optional :institute_type, :enum, 1, "google.cloud.channel.v1.EduData.InstituteType"
      optional :institute_size, :enum, 2, "google.cloud.channel.v1.EduData.InstituteSize"
      optional :website, :string, 3
    end
    add_enum "google.cloud.channel.v1.EduData.InstituteType" do
      value :INSTITUTE_TYPE_UNSPECIFIED, 0
      value :K12, 1
      value :UNIVERSITY, 2
    end
    add_enum "google.cloud.channel.v1.EduData.InstituteSize" do
      value :INSTITUTE_SIZE_UNSPECIFIED, 0
      value :SIZE_1_100, 1
      value :SIZE_101_500, 2
      value :SIZE_501_1000, 3
      value :SIZE_1001_2000, 4
      value :SIZE_2001_5000, 5
      value :SIZE_5001_10000, 6
      value :SIZE_10001_OR_MORE, 7
    end
    add_message "google.cloud.channel.v1.CloudIdentityInfo" do
      optional :customer_type, :enum, 1, "google.cloud.channel.v1.CloudIdentityInfo.CustomerType"
      optional :primary_domain, :string, 9
      optional :is_domain_verified, :bool, 4
      optional :alternate_email, :string, 6
      optional :phone_number, :string, 7
      optional :language_code, :string, 8
      optional :admin_console_uri, :string, 10
      optional :edu_data, :message, 22, "google.cloud.channel.v1.EduData"
    end
    add_enum "google.cloud.channel.v1.CloudIdentityInfo.CustomerType" do
      value :CUSTOMER_TYPE_UNSPECIFIED, 0
      value :DOMAIN, 1
      value :TEAM, 2
    end
    add_message "google.cloud.channel.v1.Value" do
      oneof :kind do
        optional :int64_value, :int64, 1
        optional :string_value, :string, 2
        optional :double_value, :double, 3
        optional :proto_value, :message, 4, "google.protobuf.Any"
        optional :bool_value, :bool, 5
      end
    end
    add_message "google.cloud.channel.v1.AdminUser" do
      optional :email, :string, 1
      optional :given_name, :string, 2
      optional :family_name, :string, 3
    end
  end
end

module Google
  module Cloud
    module Channel
      module V1
        EduData = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.EduData").msgclass
        EduData::InstituteType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.EduData.InstituteType").enummodule
        EduData::InstituteSize = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.EduData.InstituteSize").enummodule
        CloudIdentityInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.CloudIdentityInfo").msgclass
        CloudIdentityInfo::CustomerType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.CloudIdentityInfo.CustomerType").enummodule
        Value = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.Value").msgclass
        AdminUser = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.channel.v1.AdminUser").msgclass
      end
    end
  end
end
