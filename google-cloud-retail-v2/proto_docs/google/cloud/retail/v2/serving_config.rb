# frozen_string_literal: true

# Copyright 2022 Google LLC
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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Retail
      module V2
        # Configures metadata that is used to generate serving time results (e.g.
        # search results or recommendation predictions).
        # @!attribute [rw] name
        #   @return [::String]
        #     Immutable. Fully qualified name
        #     `projects/*/locations/global/catalogs/*/servingConfig/*`
        # @!attribute [rw] display_name
        #   @return [::String]
        #     Required. The human readable serving config display name. Used in Retail
        #     UI.
        #
        #     This field must be a UTF-8 encoded string with a length limit of 128
        #     characters. Otherwise, an INVALID_ARGUMENT error is returned.
        # @!attribute [rw] model_id
        #   @return [::String]
        #     The id of the model in the same {::Google::Cloud::Retail::V2::Catalog Catalog}
        #     to use at serving time. Currently only RecommendationModels are supported:
        #     https://cloud.google.com/retail/recommendations-ai/docs/create-models
        #     Can be changed but only to a compatible model (e.g.
        #     others-you-may-like CTR to others-you-may-like CVR).
        #
        #     Required when
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_RECOMMENDATION][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_RECOMMENDATION].
        # @!attribute [rw] price_reranking_level
        #   @return [::String]
        #     How much price ranking we want in serving results.
        #     Price reranking causes product items with a similar
        #     recommendation probability to be ordered by price, with the
        #     highest-priced items first. This setting could result in a decrease in
        #     click-through and conversion rates.
        #      Allowed values are:
        #
        #     * 'no-price-reranking'
        #     * 'low-price-raranking'
        #     * 'medium-price-reranking'
        #     * 'high-price-reranking'
        #
        #     If not specified, we choose default based on model type. Default value:
        #     'no-price-reranking'.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_RECOMMENDATION][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_RECOMMENDATION].
        # @!attribute [rw] facet_control_ids
        #   @return [::Array<::String>]
        #     Facet specifications for faceted search. If empty, no facets are returned.
        #     The ids refer to the ids of {::Google::Cloud::Retail::V2::Control Control}
        #     resources with only the Facet control set. These controls are assumed to be
        #     in the same {::Google::Cloud::Retail::V2::Catalog Catalog} as the
        #     {::Google::Cloud::Retail::V2::ServingConfig ServingConfig}.
        #     A maximum of 100 values are allowed. Otherwise, an INVALID_ARGUMENT error
        #     is returned.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] dynamic_facet_spec
        #   @return [::Google::Cloud::Retail::V2::SearchRequest::DynamicFacetSpec]
        #     The specification for dynamically generated facets. Notice that only
        #     textual facets can be dynamically generated.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] boost_control_ids
        #   @return [::Array<::String>]
        #     Condition boost specifications. If a product matches multiple conditions
        #     in the specifications, boost scores from these specifications are all
        #     applied and combined in a non-linear way. Maximum number of
        #     specifications is 100.
        #
        #     Notice that if both
        #     {::Google::Cloud::Retail::V2::ServingConfig#boost_control_ids ServingConfig.boost_control_ids}
        #     and
        #     {::Google::Cloud::Retail::V2::SearchRequest#boost_spec SearchRequest.boost_spec}
        #     are set, the boost conditions from both places are evaluated. If a search
        #     request matches multiple boost conditions, the final boost score is equal
        #     to the sum of the boost scores from all matched boost conditions.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] filter_control_ids
        #   @return [::Array<::String>]
        #     Condition filter specifications. If a product matches multiple conditions
        #     in the specifications, filters from these specifications are all
        #     applied and combined via the AND operator. Maximum number of
        #     specifications is 100.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] redirect_control_ids
        #   @return [::Array<::String>]
        #     Condition redirect specifications. Only the first triggered redirect action
        #     is applied, even if multiple apply. Maximum number of specifications is
        #     1000.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] twoway_synonyms_control_ids
        #   @return [::Array<::String>]
        #     Condition synonyms specifications. If multiple syonyms conditions match,
        #     all matching synonyms control in the list will execute. Order of controls
        #     in the list will not matter. Maximum number of specifications is
        #     100.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] oneway_synonyms_control_ids
        #   @return [::Array<::String>]
        #     Condition oneway synonyms specifications. If multiple oneway synonyms
        #     conditions match, all matching oneway synonyms controls in the list will
        #     execute. Order of controls in the list will not matter. Maximum number of
        #     specifications is 100.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] do_not_associate_control_ids
        #   @return [::Array<::String>]
        #     Condition do not associate specifications. If multiple do not associate
        #     conditions match, all matching do not associate controls in the list will
        #     execute.
        #     - Order does not matter.
        #     - Maximum number of specifications is 100.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] replacement_control_ids
        #   @return [::Array<::String>]
        #     Condition replacement specifications.
        #     - Applied according to the order in the list.
        #     - A previously replaced term can not be re-replaced.
        #     - Maximum number of specifications is 100.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] ignore_control_ids
        #   @return [::Array<::String>]
        #     Condition ignore specifications. If multiple ignore
        #     conditions match, all matching ignore controls in the list will
        #     execute.
        #     - Order does not matter.
        #     - Maximum number of specifications is 100.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        # @!attribute [rw] diversity_level
        #   @return [::String]
        #     How much diversity to use in recommendation model results e.g.
        #     'medium-diversity' or 'high-diversity'. Currently supported values:
        #
        #     * 'no-diversity'
        #     * 'low-diversity'
        #     * 'medium-diversity'
        #     * 'high-diversity'
        #     * 'auto-diversity'
        #
        #     If not specified, we choose default based on recommendation model
        #     type. Default value: 'no-diversity'.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_RECOMMENDATION][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_RECOMMENDATION].
        # @!attribute [rw] enable_category_filter_level
        #   @return [::String]
        #     Whether to add additional category filters on the 'similar-items' model.
        #     If not specified, we enable it by default.
        #      Allowed values are:
        #
        #     * 'no-category-match': No additional filtering of original results from
        #       the model and the customer's filters.
        #     * 'relaxed-category-match': Only keep results with categories that match
        #       at least one item categories in the PredictRequests's context item.
        #       * If customer also sends filters in the PredictRequest, then the results
        #       will satisfy both conditions (user given and category match).
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_RECOMMENDATION][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_RECOMMENDATION].
        # @!attribute [rw] personalization_spec
        #   @return [::Google::Cloud::Retail::V2::SearchRequest::PersonalizationSpec]
        #     The specification for personalization spec.
        #
        #     Can only be set if
        #     {::Google::Cloud::Retail::V2::ServingConfig#solution_types solution_types} is
        #     [SOLUTION_TYPE_SEARCH][google.cloud.retail.v2main.SolutionType.SOLUTION_TYPE_SEARCH].
        #
        #     Notice that if both
        #     {::Google::Cloud::Retail::V2::ServingConfig#personalization_spec ServingConfig.personalization_spec}
        #     and
        #     {::Google::Cloud::Retail::V2::SearchRequest#personalization_spec SearchRequest.personalization_spec}
        #     are set.
        #     {::Google::Cloud::Retail::V2::SearchRequest#personalization_spec SearchRequest.personalization_spec}
        #     will override
        #     {::Google::Cloud::Retail::V2::ServingConfig#personalization_spec ServingConfig.personalization_spec}.
        # @!attribute [rw] solution_types
        #   @return [::Array<::Google::Cloud::Retail::V2::SolutionType>]
        #     Required. Immutable. Specifies the solution types that a serving config can
        #     be associated with. Currently we support setting only one type of solution.
        class ServingConfig
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end