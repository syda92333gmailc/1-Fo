# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/securitycenter/v1/database.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/securitycenter/v1/database.proto", :syntax => :proto3) do
    add_message "google.cloud.securitycenter.v1.Database" do
      optional :name, :string, 1
      optional :display_name, :string, 2
      optional :user_name, :string, 3
      optional :query, :string, 4
      repeated :grantees, :string, 5
    end
  end
end

module Google
  module Cloud
    module SecurityCenter
      module V1
        Database = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Database").msgclass
      end
    end
  end
end
