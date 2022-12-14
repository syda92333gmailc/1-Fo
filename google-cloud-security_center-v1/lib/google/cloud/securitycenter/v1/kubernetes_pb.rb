# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/securitycenter/v1/kubernetes.proto

require 'google/protobuf'

require 'google/cloud/securitycenter/v1/container_pb'
require 'google/cloud/securitycenter/v1/label_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/securitycenter/v1/kubernetes.proto", :syntax => :proto3) do
    add_message "google.cloud.securitycenter.v1.Kubernetes" do
      repeated :pods, :message, 1, "google.cloud.securitycenter.v1.Kubernetes.Pod"
      repeated :nodes, :message, 2, "google.cloud.securitycenter.v1.Kubernetes.Node"
      repeated :node_pools, :message, 3, "google.cloud.securitycenter.v1.Kubernetes.NodePool"
      repeated :roles, :message, 4, "google.cloud.securitycenter.v1.Kubernetes.Role"
      repeated :bindings, :message, 5, "google.cloud.securitycenter.v1.Kubernetes.Binding"
      repeated :access_reviews, :message, 6, "google.cloud.securitycenter.v1.Kubernetes.AccessReview"
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.Pod" do
      optional :ns, :string, 1
      optional :name, :string, 2
      repeated :labels, :message, 3, "google.cloud.securitycenter.v1.Label"
      repeated :containers, :message, 4, "google.cloud.securitycenter.v1.Container"
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.Node" do
      optional :name, :string, 1
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.NodePool" do
      optional :name, :string, 1
      repeated :nodes, :message, 2, "google.cloud.securitycenter.v1.Kubernetes.Node"
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.Role" do
      optional :kind, :enum, 1, "google.cloud.securitycenter.v1.Kubernetes.Role.Kind"
      optional :ns, :string, 2
      optional :name, :string, 3
    end
    add_enum "google.cloud.securitycenter.v1.Kubernetes.Role.Kind" do
      value :KIND_UNSPECIFIED, 0
      value :ROLE, 1
      value :CLUSTER_ROLE, 2
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.Binding" do
      optional :ns, :string, 1
      optional :name, :string, 2
      optional :role, :message, 3, "google.cloud.securitycenter.v1.Kubernetes.Role"
      repeated :subjects, :message, 4, "google.cloud.securitycenter.v1.Kubernetes.Subject"
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.Subject" do
      optional :kind, :enum, 1, "google.cloud.securitycenter.v1.Kubernetes.Subject.AuthType"
      optional :ns, :string, 2
      optional :name, :string, 3
    end
    add_enum "google.cloud.securitycenter.v1.Kubernetes.Subject.AuthType" do
      value :AUTH_TYPE_UNSPECIFIED, 0
      value :USER, 1
      value :SERVICEACCOUNT, 2
      value :GROUP, 3
    end
    add_message "google.cloud.securitycenter.v1.Kubernetes.AccessReview" do
      optional :group, :string, 1
      optional :ns, :string, 2
      optional :name, :string, 3
      optional :resource, :string, 4
      optional :subresource, :string, 5
      optional :verb, :string, 6
      optional :version, :string, 7
    end
  end
end

module Google
  module Cloud
    module SecurityCenter
      module V1
        Kubernetes = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes").msgclass
        Kubernetes::Pod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Pod").msgclass
        Kubernetes::Node = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Node").msgclass
        Kubernetes::NodePool = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.NodePool").msgclass
        Kubernetes::Role = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Role").msgclass
        Kubernetes::Role::Kind = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Role.Kind").enummodule
        Kubernetes::Binding = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Binding").msgclass
        Kubernetes::Subject = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Subject").msgclass
        Kubernetes::Subject::AuthType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.Subject.AuthType").enummodule
        Kubernetes::AccessReview = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.securitycenter.v1.Kubernetes.AccessReview").msgclass
      end
    end
  end
end
