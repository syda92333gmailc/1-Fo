# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/cloud/automl/v1/prediction_service.proto for package 'Google.Cloud.AutoML.V1'
# Original file comments:
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'grpc'
require 'google/cloud/automl/v1/prediction_service_pb'

module Google
  module Cloud
    module AutoML
      module V1
        module PredictionService
          # AutoML Prediction API.
          #
          # On any input that is documented to expect a string parameter in
          # snake_case or dash-case, either of those cases is accepted.
          class Service

            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = 'google.cloud.automl.v1.PredictionService'

            # Perform an online prediction. The prediction result is directly
            # returned in the response.
            # Available for following ML scenarios, and their expected request payloads:
            #
            # AutoML Vision Classification
            #
            # * An image in .JPEG, .GIF or .PNG format, image_bytes up to 30MB.
            #
            # AutoML Vision Object Detection
            #
            # * An image in .JPEG, .GIF or .PNG format, image_bytes up to 30MB.
            #
            # AutoML Natural Language Classification
            #
            # * A TextSnippet up to 60,000 characters, UTF-8 encoded or a document in
            # .PDF, .TIF or .TIFF format with size upto 2MB.
            #
            # AutoML Natural Language Entity Extraction
            #
            # * A TextSnippet up to 10,000 characters, UTF-8 NFC encoded or a document
            #  in .PDF, .TIF or .TIFF format with size upto 20MB.
            #
            # AutoML Natural Language Sentiment Analysis
            #
            # * A TextSnippet up to 60,000 characters, UTF-8 encoded or a document in
            # .PDF, .TIF or .TIFF format with size upto 2MB.
            #
            # AutoML Translation
            #
            # * A TextSnippet up to 25,000 characters, UTF-8 encoded.
            #
            # AutoML Tables
            #
            # * A row with column values matching
            #   the columns of the model, up to 5MB. Not available for FORECASTING
            #   `prediction_type`.
            rpc :Predict, ::Google::Cloud::AutoML::V1::PredictRequest, ::Google::Cloud::AutoML::V1::PredictResponse
            # Perform a batch prediction. Unlike the online [Predict][google.cloud.automl.v1.PredictionService.Predict], batch
            # prediction result won't be immediately available in the response. Instead,
            # a long running operation object is returned. User can poll the operation
            # result via [GetOperation][google.longrunning.Operations.GetOperation]
            # method. Once the operation is done, [BatchPredictResult][google.cloud.automl.v1.BatchPredictResult] is returned in
            # the [response][google.longrunning.Operation.response] field.
            # Available for following ML scenarios:
            #
            # * AutoML Vision Classification
            # * AutoML Vision Object Detection
            # * AutoML Video Intelligence Classification
            # * AutoML Video Intelligence Object Tracking * AutoML Natural Language Classification
            # * AutoML Natural Language Entity Extraction
            # * AutoML Natural Language Sentiment Analysis
            # * AutoML Tables
            rpc :BatchPredict, ::Google::Cloud::AutoML::V1::BatchPredictRequest, ::Google::Longrunning::Operation
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end
