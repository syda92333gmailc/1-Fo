# frozen_string_literal: true

# Copyright 2021 Google LLC
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
    module Bigquery
      module Storage
        module V1
          # Schema of a table. This schema is a subset of
          # google.cloud.bigquery.v2.TableSchema containing information necessary to
          # generate valid message to write to BigQuery.
          # @!attribute [rw] fields
          #   @return [::Array<::Google::Cloud::Bigquery::Storage::V1::TableFieldSchema>]
          #     Describes the fields in a table.
          class TableSchema
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # TableFieldSchema defines a single field/column within a table schema.
          # @!attribute [rw] name
          #   @return [::String]
          #     Required. The field name. The name must contain only letters (a-z, A-Z),
          #     numbers (0-9), or underscores (_), and must start with a letter or
          #     underscore. The maximum length is 128 characters.
          # @!attribute [rw] type
          #   @return [::Google::Cloud::Bigquery::Storage::V1::TableFieldSchema::Type]
          #     Required. The field data type.
          # @!attribute [rw] mode
          #   @return [::Google::Cloud::Bigquery::Storage::V1::TableFieldSchema::Mode]
          #     Optional. The field mode. The default value is NULLABLE.
          # @!attribute [rw] fields
          #   @return [::Array<::Google::Cloud::Bigquery::Storage::V1::TableFieldSchema>]
          #     Optional. Describes the nested schema fields if the type property is set to STRUCT.
          # @!attribute [rw] description
          #   @return [::String]
          #     Optional. The field description. The maximum length is 1,024 characters.
          # @!attribute [rw] max_length
          #   @return [::Integer]
          #     Optional. Maximum length of values of this field for STRINGS or BYTES.
          #
          #     If max_length is not specified, no maximum length constraint is imposed
          #     on this field.
          #
          #     If type = "STRING", then max_length represents the maximum UTF-8
          #     length of strings in this field.
          #
          #     If type = "BYTES", then max_length represents the maximum number of
          #     bytes in this field.
          #
          #     It is invalid to set this field if type is not "STRING" or "BYTES".
          # @!attribute [rw] precision
          #   @return [::Integer]
          #     Optional. Precision (maximum number of total digits in base 10) and scale
          #     (maximum number of digits in the fractional part in base 10) constraints
          #     for values of this field for NUMERIC or BIGNUMERIC.
          #
          #     It is invalid to set precision or scale if type is not "NUMERIC" or
          #     "BIGNUMERIC".
          #
          #     If precision and scale are not specified, no value range constraint is
          #     imposed on this field insofar as values are permitted by the type.
          #
          #     Values of this NUMERIC or BIGNUMERIC field must be in this range when:
          #
          #     * Precision (P) and scale (S) are specified:
          #       [-10^(P-S) + 10^(-S), 10^(P-S) - 10^(-S)]
          #     * Precision (P) is specified but not scale (and thus scale is
          #       interpreted to be equal to zero):
          #       [-10^P + 1, 10^P - 1].
          #
          #     Acceptable values for precision and scale if both are specified:
          #
          #     * If type = "NUMERIC":
          #       1 <= precision - scale <= 29 and 0 <= scale <= 9.
          #     * If type = "BIGNUMERIC":
          #       1 <= precision - scale <= 38 and 0 <= scale <= 38.
          #
          #     Acceptable values for precision if only precision is specified but not
          #     scale (and thus scale is interpreted to be equal to zero):
          #
          #     * If type = "NUMERIC": 1 <= precision <= 29.
          #     * If type = "BIGNUMERIC": 1 <= precision <= 38.
          #
          #     If scale is specified but not precision, then it is invalid.
          # @!attribute [rw] scale
          #   @return [::Integer]
          #     Optional. See documentation for precision.
          class TableFieldSchema
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            module Type
              # Illegal value
              TYPE_UNSPECIFIED = 0

              # 64K, UTF8
              STRING = 1

              # 64-bit signed
              INT64 = 2

              # 64-bit IEEE floating point
              DOUBLE = 3

              # Aggregate type
              STRUCT = 4

              # 64K, Binary
              BYTES = 5

              # 2-valued
              BOOL = 6

              # 64-bit signed usec since UTC epoch
              TIMESTAMP = 7

              # Civil date - Year, Month, Day
              DATE = 8

              # Civil time - Hour, Minute, Second, Microseconds
              TIME = 9

              # Combination of civil date and civil time
              DATETIME = 10

              # Geography object
              GEOGRAPHY = 11

              # Numeric value
              NUMERIC = 12

              # BigNumeric value
              BIGNUMERIC = 13

              # Interval
              INTERVAL = 14

              # JSON, String
              JSON = 15
            end

            module Mode
              # Illegal value
              MODE_UNSPECIFIED = 0

              NULLABLE = 1

              REQUIRED = 2

              REPEATED = 3
            end
          end
        end
      end
    end
  end
end
