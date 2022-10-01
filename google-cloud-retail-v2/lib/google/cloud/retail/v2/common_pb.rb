# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/retail/v2/common.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/retail/v2/common.proto", :syntax => :proto3) do
    add_message "google.cloud.retail.v2.Condition" do
      repeated :query_terms, :message, 1, "google.cloud.retail.v2.Condition.QueryTerm"
      repeated :active_time_range, :message, 3, "google.cloud.retail.v2.Condition.TimeRange"
    end
    add_message "google.cloud.retail.v2.Condition.QueryTerm" do
      optional :value, :string, 1
      optional :full_match, :bool, 2
    end
    add_message "google.cloud.retail.v2.Condition.TimeRange" do
      optional :start_time, :message, 1, "google.protobuf.Timestamp"
      optional :end_time, :message, 2, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.retail.v2.Rule" do
      optional :condition, :message, 1, "google.cloud.retail.v2.Condition"
      oneof :action do
        optional :boost_action, :message, 2, "google.cloud.retail.v2.Rule.BoostAction"
        optional :redirect_action, :message, 3, "google.cloud.retail.v2.Rule.RedirectAction"
        optional :oneway_synonyms_action, :message, 6, "google.cloud.retail.v2.Rule.OnewaySynonymsAction"
        optional :do_not_associate_action, :message, 7, "google.cloud.retail.v2.Rule.DoNotAssociateAction"
        optional :replacement_action, :message, 8, "google.cloud.retail.v2.Rule.ReplacementAction"
        optional :ignore_action, :message, 9, "google.cloud.retail.v2.Rule.IgnoreAction"
        optional :filter_action, :message, 10, "google.cloud.retail.v2.Rule.FilterAction"
        optional :twoway_synonyms_action, :message, 11, "google.cloud.retail.v2.Rule.TwowaySynonymsAction"
      end
    end
    add_message "google.cloud.retail.v2.Rule.BoostAction" do
      optional :boost, :float, 1
      optional :products_filter, :string, 2
    end
    add_message "google.cloud.retail.v2.Rule.FilterAction" do
      optional :filter, :string, 1
    end
    add_message "google.cloud.retail.v2.Rule.RedirectAction" do
      optional :redirect_uri, :string, 1
    end
    add_message "google.cloud.retail.v2.Rule.TwowaySynonymsAction" do
      repeated :synonyms, :string, 1
    end
    add_message "google.cloud.retail.v2.Rule.OnewaySynonymsAction" do
      repeated :query_terms, :string, 3
      repeated :synonyms, :string, 4
      repeated :oneway_terms, :string, 2
    end
    add_message "google.cloud.retail.v2.Rule.DoNotAssociateAction" do
      repeated :query_terms, :string, 2
      repeated :do_not_associate_terms, :string, 3
      repeated :terms, :string, 1
    end
    add_message "google.cloud.retail.v2.Rule.ReplacementAction" do
      repeated :query_terms, :string, 2
      optional :replacement_term, :string, 3
      optional :term, :string, 1
    end
    add_message "google.cloud.retail.v2.Rule.IgnoreAction" do
      repeated :ignore_terms, :string, 1
    end
    add_message "google.cloud.retail.v2.Audience" do
      repeated :genders, :string, 1
      repeated :age_groups, :string, 2
    end
    add_message "google.cloud.retail.v2.ColorInfo" do
      repeated :color_families, :string, 1
      repeated :colors, :string, 2
    end
    add_message "google.cloud.retail.v2.CustomAttribute" do
      repeated :text, :string, 1
      repeated :numbers, :double, 2
      proto3_optional :searchable, :bool, 3
      proto3_optional :indexable, :bool, 4
    end
    add_message "google.cloud.retail.v2.FulfillmentInfo" do
      optional :type, :string, 1
      repeated :place_ids, :string, 2
    end
    add_message "google.cloud.retail.v2.Image" do
      optional :uri, :string, 1
      optional :height, :int32, 2
      optional :width, :int32, 3
    end
    add_message "google.cloud.retail.v2.Interval" do
      oneof :min do
        optional :minimum, :double, 1
        optional :exclusive_minimum, :double, 2
      end
      oneof :max do
        optional :maximum, :double, 3
        optional :exclusive_maximum, :double, 4
      end
    end
    add_message "google.cloud.retail.v2.PriceInfo" do
      optional :currency_code, :string, 1
      optional :price, :float, 2
      optional :original_price, :float, 3
      optional :cost, :float, 4
      optional :price_effective_time, :message, 5, "google.protobuf.Timestamp"
      optional :price_expire_time, :message, 6, "google.protobuf.Timestamp"
      optional :price_range, :message, 7, "google.cloud.retail.v2.PriceInfo.PriceRange"
    end
    add_message "google.cloud.retail.v2.PriceInfo.PriceRange" do
      optional :price, :message, 1, "google.cloud.retail.v2.Interval"
      optional :original_price, :message, 2, "google.cloud.retail.v2.Interval"
    end
    add_message "google.cloud.retail.v2.Rating" do
      optional :rating_count, :int32, 1
      optional :average_rating, :float, 2
      repeated :rating_histogram, :int32, 3
    end
    add_message "google.cloud.retail.v2.UserInfo" do
      optional :user_id, :string, 1
      optional :ip_address, :string, 2
      optional :user_agent, :string, 3
      optional :direct_user_request, :bool, 4
    end
    add_message "google.cloud.retail.v2.LocalInventory" do
      optional :place_id, :string, 1
      optional :price_info, :message, 2, "google.cloud.retail.v2.PriceInfo"
      map :attributes, :string, :message, 3, "google.cloud.retail.v2.CustomAttribute"
      repeated :fulfillment_types, :string, 4
    end
    add_enum "google.cloud.retail.v2.AttributeConfigLevel" do
      value :ATTRIBUTE_CONFIG_LEVEL_UNSPECIFIED, 0
      value :PRODUCT_LEVEL_ATTRIBUTE_CONFIG, 1
      value :CATALOG_LEVEL_ATTRIBUTE_CONFIG, 2
    end
    add_enum "google.cloud.retail.v2.SolutionType" do
      value :SOLUTION_TYPE_UNSPECIFIED, 0
      value :SOLUTION_TYPE_RECOMMENDATION, 1
      value :SOLUTION_TYPE_SEARCH, 2
    end
    add_enum "google.cloud.retail.v2.SearchSolutionUseCase" do
      value :SEARCH_SOLUTION_USE_CASE_UNSPECIFIED, 0
      value :SEARCH_SOLUTION_USE_CASE_SEARCH, 1
      value :SEARCH_SOLUTION_USE_CASE_BROWSE, 2
    end
  end
end

module Google
  module Cloud
    module Retail
      module V2
        Condition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Condition").msgclass
        Condition::QueryTerm = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Condition.QueryTerm").msgclass
        Condition::TimeRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Condition.TimeRange").msgclass
        Rule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule").msgclass
        Rule::BoostAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.BoostAction").msgclass
        Rule::FilterAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.FilterAction").msgclass
        Rule::RedirectAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.RedirectAction").msgclass
        Rule::TwowaySynonymsAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.TwowaySynonymsAction").msgclass
        Rule::OnewaySynonymsAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.OnewaySynonymsAction").msgclass
        Rule::DoNotAssociateAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.DoNotAssociateAction").msgclass
        Rule::ReplacementAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.ReplacementAction").msgclass
        Rule::IgnoreAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rule.IgnoreAction").msgclass
        Audience = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Audience").msgclass
        ColorInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.ColorInfo").msgclass
        CustomAttribute = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.CustomAttribute").msgclass
        FulfillmentInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.FulfillmentInfo").msgclass
        Image = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Image").msgclass
        Interval = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Interval").msgclass
        PriceInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.PriceInfo").msgclass
        PriceInfo::PriceRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.PriceInfo.PriceRange").msgclass
        Rating = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.Rating").msgclass
        UserInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.UserInfo").msgclass
        LocalInventory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.LocalInventory").msgclass
        AttributeConfigLevel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.AttributeConfigLevel").enummodule
        SolutionType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.SolutionType").enummodule
        SearchSolutionUseCase = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.retail.v2.SearchSolutionUseCase").enummodule
      end
    end
  end
end