# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/documentai/v1beta3/barcode.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/documentai/v1beta3/barcode.proto", :syntax => :proto3) do
    add_message "google.cloud.documentai.v1beta3.Barcode" do
      optional :format, :string, 1
      optional :value_format, :string, 2
      optional :raw_value, :string, 3
    end
  end
end

module Google
  module Cloud
    module DocumentAI
      module V1beta3
        Barcode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.documentai.v1beta3.Barcode").msgclass
      end
    end
  end
end
