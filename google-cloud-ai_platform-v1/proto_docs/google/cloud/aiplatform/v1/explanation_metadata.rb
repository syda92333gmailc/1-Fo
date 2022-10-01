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
    module AIPlatform
      module V1
        # Metadata describing the Model's input and output for explanation.
        # @!attribute [rw] inputs
        #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata}]
        #     Required. Map from feature names to feature input metadata. Keys are the name of the
        #     features. Values are the specification of the feature.
        #
        #     An empty InputMetadata is valid. It describes a text feature which has the
        #     name specified as the key in {::Google::Cloud::AIPlatform::V1::ExplanationMetadata#inputs ExplanationMetadata.inputs}. The baseline
        #     of the empty feature is chosen by Vertex AI.
        #
        #     For Vertex AI-provided Tensorflow images, the key can be any friendly
        #     name of the feature. Once specified,
        #     {::Google::Cloud::AIPlatform::V1::Attribution#feature_attributions featureAttributions} are keyed by
        #     this key (if not grouped with another feature).
        #
        #     For custom images, the key must match with the key in
        #     {::Google::Cloud::AIPlatform::V1::ExplainRequest#instances instance}.
        # @!attribute [rw] outputs
        #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::AIPlatform::V1::ExplanationMetadata::OutputMetadata}]
        #     Required. Map from output names to output metadata.
        #
        #     For Vertex AI-provided Tensorflow images, keys can be any user defined
        #     string that consists of any UTF-8 characters.
        #
        #     For custom images, keys are the name of the output field in the prediction
        #     to be explained.
        #
        #     Currently only one key is allowed.
        # @!attribute [rw] feature_attributions_schema_uri
        #   @return [::String]
        #     Points to a YAML file stored on Google Cloud Storage describing the format
        #     of the {::Google::Cloud::AIPlatform::V1::Attribution#feature_attributions feature attributions}.
        #     The schema is defined as an OpenAPI 3.0.2 [Schema
        #     Object](https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.0.2.md#schemaObject).
        #     AutoML tabular Models always have this field populated by Vertex AI.
        #     Note: The URI given on output may be different, including the URI scheme,
        #     than the one given on input. The output URI will point to a location where
        #     the user only has a read access.
        # @!attribute [rw] latent_space_source
        #   @return [::String]
        #     Name of the source to generate embeddings for example based explanations.
        class ExplanationMetadata
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Metadata of the input of a feature.
          #
          # Fields other than {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#input_baselines InputMetadata.input_baselines} are applicable only
          # for Models that are using Vertex AI-provided images for Tensorflow.
          # @!attribute [rw] input_baselines
          #   @return [::Array<::Google::Protobuf::Value>]
          #     Baseline inputs for this feature.
          #
          #     If no baseline is specified, Vertex AI chooses the baseline for this
          #     feature. If multiple baselines are specified, Vertex AI returns the
          #     average attributions across them in {::Google::Cloud::AIPlatform::V1::Attribution#feature_attributions Attribution.feature_attributions}.
          #
          #     For Vertex AI-provided Tensorflow images (both 1.x and 2.x), the shape
          #     of each baseline must match the shape of the input tensor. If a scalar is
          #     provided, we broadcast to the same shape as the input tensor.
          #
          #     For custom images, the element of the baselines must be in the same
          #     format as the feature's input in the
          #     {::Google::Cloud::AIPlatform::V1::ExplainRequest#instances instance}[]. The schema of any single instance
          #     may be specified via Endpoint's DeployedModels'
          #     [Model's][google.cloud.aiplatform.v1.DeployedModel.model]
          #     [PredictSchemata's][google.cloud.aiplatform.v1.Model.predict_schemata]
          #     {::Google::Cloud::AIPlatform::V1::PredictSchemata#instance_schema_uri instance_schema_uri}.
          # @!attribute [rw] input_tensor_name
          #   @return [::String]
          #     Name of the input tensor for this feature. Required and is only
          #     applicable to Vertex AI-provided images for Tensorflow.
          # @!attribute [rw] encoding
          #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::Encoding]
          #     Defines how the feature is encoded into the input tensor. Defaults to
          #     IDENTITY.
          # @!attribute [rw] modality
          #   @return [::String]
          #     Modality of the feature. Valid values are: numeric, image. Defaults to
          #     numeric.
          # @!attribute [rw] feature_value_domain
          #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::FeatureValueDomain]
          #     The domain details of the input feature value. Like min/max, original
          #     mean or standard deviation if normalized.
          # @!attribute [rw] indices_tensor_name
          #   @return [::String]
          #     Specifies the index of the values of the input tensor.
          #     Required when the input tensor is a sparse representation. Refer to
          #     Tensorflow documentation for more details:
          #     https://www.tensorflow.org/api_docs/python/tf/sparse/SparseTensor.
          # @!attribute [rw] dense_shape_tensor_name
          #   @return [::String]
          #     Specifies the shape of the values of the input if the input is a sparse
          #     representation. Refer to Tensorflow documentation for more details:
          #     https://www.tensorflow.org/api_docs/python/tf/sparse/SparseTensor.
          # @!attribute [rw] index_feature_mapping
          #   @return [::Array<::String>]
          #     A list of feature names for each index in the input tensor.
          #     Required when the input {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#encoding InputMetadata.encoding} is BAG_OF_FEATURES,
          #     BAG_OF_FEATURES_SPARSE, INDICATOR.
          # @!attribute [rw] encoded_tensor_name
          #   @return [::String]
          #     Encoded tensor is a transformation of the input tensor. Must be provided
          #     if choosing
          #     {::Google::Cloud::AIPlatform::V1::ExplanationParameters#integrated_gradients_attribution Integrated Gradients attribution}
          #     or {::Google::Cloud::AIPlatform::V1::ExplanationParameters#xrai_attribution XRAI attribution} and the
          #     input tensor is not differentiable.
          #
          #     An encoded tensor is generated if the input tensor is encoded by a lookup
          #     table.
          # @!attribute [rw] encoded_baselines
          #   @return [::Array<::Google::Protobuf::Value>]
          #     A list of baselines for the encoded tensor.
          #
          #     The shape of each baseline should match the shape of the encoded tensor.
          #     If a scalar is provided, Vertex AI broadcasts to the same shape as the
          #     encoded tensor.
          # @!attribute [rw] visualization
          #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::Visualization]
          #     Visualization configurations for image explanation.
          # @!attribute [rw] group_name
          #   @return [::String]
          #     Name of the group that the input belongs to. Features with the same group
          #     name will be treated as one feature when computing attributions. Features
          #     grouped together can have different shapes in value. If provided, there
          #     will be one single attribution generated in
          #     {::Google::Cloud::AIPlatform::V1::Attribution#feature_attributions Attribution.feature_attributions}, keyed by the group name.
          class InputMetadata
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Domain details of the input feature value. Provides numeric information
            # about the feature, such as its range (min, max). If the feature has been
            # pre-processed, for example with z-scoring, then it provides information
            # about how to recover the original feature. For example, if the input
            # feature is an image and it has been pre-processed to obtain 0-mean and
            # stddev = 1 values, then original_mean, and original_stddev refer to the
            # mean and stddev of the original feature (e.g. image tensor) from which
            # input feature (with mean = 0 and stddev = 1) was obtained.
            # @!attribute [rw] min_value
            #   @return [::Float]
            #     The minimum permissible value for this feature.
            # @!attribute [rw] max_value
            #   @return [::Float]
            #     The maximum permissible value for this feature.
            # @!attribute [rw] original_mean
            #   @return [::Float]
            #     If this input feature has been normalized to a mean value of 0,
            #     the original_mean specifies the mean value of the domain prior to
            #     normalization.
            # @!attribute [rw] original_stddev
            #   @return [::Float]
            #     If this input feature has been normalized to a standard deviation of
            #     1.0, the original_stddev specifies the standard deviation of the domain
            #     prior to normalization.
            class FeatureValueDomain
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Visualization configurations for image explanation.
            # @!attribute [rw] type
            #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::Visualization::Type]
            #     Type of the image visualization. Only applicable to
            #     {::Google::Cloud::AIPlatform::V1::ExplanationParameters#integrated_gradients_attribution Integrated Gradients attribution}.
            #     OUTLINES shows regions of attribution, while PIXELS shows per-pixel
            #     attribution. Defaults to OUTLINES.
            # @!attribute [rw] polarity
            #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::Visualization::Polarity]
            #     Whether to only highlight pixels with positive contributions, negative
            #     or both. Defaults to POSITIVE.
            # @!attribute [rw] color_map
            #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::Visualization::ColorMap]
            #     The color scheme used for the highlighted areas.
            #
            #     Defaults to PINK_GREEN for
            #     {::Google::Cloud::AIPlatform::V1::ExplanationParameters#integrated_gradients_attribution Integrated Gradients attribution},
            #     which shows positive attributions in green and negative in pink.
            #
            #     Defaults to VIRIDIS for
            #     {::Google::Cloud::AIPlatform::V1::ExplanationParameters#xrai_attribution XRAI attribution}, which
            #     highlights the most influential regions in yellow and the least
            #     influential in blue.
            # @!attribute [rw] clip_percent_upperbound
            #   @return [::Float]
            #     Excludes attributions above the specified percentile from the
            #     highlighted areas. Using the clip_percent_upperbound and
            #     clip_percent_lowerbound together can be useful for filtering out noise
            #     and making it easier to see areas of strong attribution. Defaults to
            #     99.9.
            # @!attribute [rw] clip_percent_lowerbound
            #   @return [::Float]
            #     Excludes attributions below the specified percentile, from the
            #     highlighted areas. Defaults to 62.
            # @!attribute [rw] overlay_type
            #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata::Visualization::OverlayType]
            #     How the original image is displayed in the visualization.
            #     Adjusting the overlay can help increase visual clarity if the original
            #     image makes it difficult to view the visualization. Defaults to NONE.
            class Visualization
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods

              # Type of the image visualization. Only applicable to
              # {::Google::Cloud::AIPlatform::V1::ExplanationParameters#integrated_gradients_attribution Integrated Gradients attribution}.
              module Type
                # Should not be used.
                TYPE_UNSPECIFIED = 0

                # Shows which pixel contributed to the image prediction.
                PIXELS = 1

                # Shows which region contributed to the image prediction by outlining
                # the region.
                OUTLINES = 2
              end

              # Whether to only highlight pixels with positive contributions, negative
              # or both. Defaults to POSITIVE.
              module Polarity
                # Default value. This is the same as POSITIVE.
                POLARITY_UNSPECIFIED = 0

                # Highlights the pixels/outlines that were most influential to the
                # model's prediction.
                POSITIVE = 1

                # Setting polarity to negative highlights areas that does not lead to
                # the models's current prediction.
                NEGATIVE = 2

                # Shows both positive and negative attributions.
                BOTH = 3
              end

              # The color scheme used for highlighting areas.
              module ColorMap
                # Should not be used.
                COLOR_MAP_UNSPECIFIED = 0

                # Positive: green. Negative: pink.
                PINK_GREEN = 1

                # Viridis color map: A perceptually uniform color mapping which is
                # easier to see by those with colorblindness and progresses from yellow
                # to green to blue. Positive: yellow. Negative: blue.
                VIRIDIS = 2

                # Positive: red. Negative: red.
                RED = 3

                # Positive: green. Negative: green.
                GREEN = 4

                # Positive: green. Negative: red.
                RED_GREEN = 6

                # PiYG palette.
                PINK_WHITE_GREEN = 5
              end

              # How the original image is displayed in the visualization.
              module OverlayType
                # Default value. This is the same as NONE.
                OVERLAY_TYPE_UNSPECIFIED = 0

                # No overlay.
                NONE = 1

                # The attributions are shown on top of the original image.
                ORIGINAL = 2

                # The attributions are shown on top of grayscaled version of the
                # original image.
                GRAYSCALE = 3

                # The attributions are used as a mask to reveal predictive parts of
                # the image and hide the un-predictive parts.
                MASK_BLACK = 4
              end
            end

            # Defines how a feature is encoded. Defaults to IDENTITY.
            module Encoding
              # Default value. This is the same as IDENTITY.
              ENCODING_UNSPECIFIED = 0

              # The tensor represents one feature.
              IDENTITY = 1

              # The tensor represents a bag of features where each index maps to
              # a feature. {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#index_feature_mapping InputMetadata.index_feature_mapping} must be provided for
              # this encoding. For example:
              # ```
              # input = [27, 6.0, 150]
              # index_feature_mapping = ["age", "height", "weight"]
              # ```
              BAG_OF_FEATURES = 2

              # The tensor represents a bag of features where each index maps to a
              # feature. Zero values in the tensor indicates feature being
              # non-existent. {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#index_feature_mapping InputMetadata.index_feature_mapping} must be provided
              # for this encoding. For example:
              # ```
              # input = [2, 0, 5, 0, 1]
              # index_feature_mapping = ["a", "b", "c", "d", "e"]
              # ```
              BAG_OF_FEATURES_SPARSE = 3

              # The tensor is a list of binaries representing whether a feature exists
              # or not (1 indicates existence). {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#index_feature_mapping InputMetadata.index_feature_mapping}
              # must be provided for this encoding. For example:
              # ```
              # input = [1, 0, 1, 0, 1]
              # index_feature_mapping = ["a", "b", "c", "d", "e"]
              # ```
              INDICATOR = 4

              # The tensor is encoded into a 1-dimensional array represented by an
              # encoded tensor. {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#encoded_tensor_name InputMetadata.encoded_tensor_name} must be provided
              # for this encoding. For example:
              # ```
              # input = ["This", "is", "a", "test", "."]
              # encoded = [0.1, 0.2, 0.3, 0.4, 0.5]
              # ```
              COMBINED_EMBEDDING = 5

              # Select this encoding when the input tensor is encoded into a
              # 2-dimensional array represented by an encoded tensor.
              # {::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata#encoded_tensor_name InputMetadata.encoded_tensor_name} must be provided for this
              # encoding. The first dimension of the encoded tensor's shape is the same
              # as the input tensor's shape. For example:
              # ```
              # input = ["This", "is", "a", "test", "."]
              # encoded = [[0.1, 0.2, 0.3, 0.4, 0.5],
              #            [0.2, 0.1, 0.4, 0.3, 0.5],
              #            [0.5, 0.1, 0.3, 0.5, 0.4],
              #            [0.5, 0.3, 0.1, 0.2, 0.4],
              #            [0.4, 0.3, 0.2, 0.5, 0.1]]
              # ```
              CONCAT_EMBEDDING = 6
            end
          end

          # Metadata of the prediction output to be explained.
          # @!attribute [rw] index_display_name_mapping
          #   @return [::Google::Protobuf::Value]
          #     Static mapping between the index and display name.
          #
          #     Use this if the outputs are a deterministic n-dimensional array, e.g. a
          #     list of scores of all the classes in a pre-defined order for a
          #     multi-classification Model. It's not feasible if the outputs are
          #     non-deterministic, e.g. the Model produces top-k classes or sort the
          #     outputs by their values.
          #
          #     The shape of the value must be an n-dimensional array of strings. The
          #     number of dimensions must match that of the outputs to be explained.
          #     The {::Google::Cloud::AIPlatform::V1::Attribution#output_display_name Attribution.output_display_name} is populated by locating in the
          #     mapping with {::Google::Cloud::AIPlatform::V1::Attribution#output_index Attribution.output_index}.
          # @!attribute [rw] display_name_mapping_key
          #   @return [::String]
          #     Specify a field name in the prediction to look for the display name.
          #
          #     Use this if the prediction contains the display names for the outputs.
          #
          #     The display names in the prediction must have the same shape of the
          #     outputs, so that it can be located by {::Google::Cloud::AIPlatform::V1::Attribution#output_index Attribution.output_index} for
          #     a specific output.
          # @!attribute [rw] output_tensor_name
          #   @return [::String]
          #     Name of the output tensor. Required and is only applicable to Vertex
          #     AI provided images for Tensorflow.
          class OutputMetadata
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::InputMetadata]
          class InputsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::Google::Cloud::AIPlatform::V1::ExplanationMetadata::OutputMetadata]
          class OutputsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end