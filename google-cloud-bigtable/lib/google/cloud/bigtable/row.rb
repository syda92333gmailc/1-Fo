# frozen_string_literal: true

# Copyright 2018 Google LLC
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


module Google
  module Cloud
    module Bigtable
      ##
      # # Row
      #
      # Row structure based on merged cells using read row state.
      #
      class Row
        ##
        # Cell
        #
        # Row cell built from data chunks.
        #
        class Cell
          attr_reader :family
          attr_reader :qualifier
          attr_reader :value
          attr_reader :labels
          attr_reader :timestamp

          ##
          # Creates a row cell instance.
          #
          # @param family [String] Column family name.
          # @param qualifier [String] Column cell qualifier name.
          # @param timestamp [Integer] Timestamp in microseconds.
          # @param value [String] Cell value.
          # @param labels [Array<String>] List of label array.
          #
          def initialize family, qualifier, timestamp, value, labels = []
            @family = family
            @qualifier = qualifier
            @timestamp = timestamp
            @value = value
            @labels = labels
          end

          ##
          # Converts timestamp to Time instance.
          #
          # @param granularity [Symbol] Optional.
          #   Valid granularity types are `:micros`, `:millis`.
          #   Default is `:millis`.
          # @return [Time | nil]
          #
          def to_time granularity = nil
            return nil if @timestamp.zero?
            return Time.at @timestamp / 1_000_000.0 if granularity == :micros
            Time.at @timestamp / 1000.0
          end

          ##
          # Converts a value to an integer.
          #
          # @return [Integer]
          #
          def to_i
            @value.unpack1 "q>"
          end

          # @private
          #
          # Cell object comparator.
          #
          # @return [Boolean]
          #
          def == other
            return false unless self.class == other.class

            instance_variables.all? do |var|
              instance_variable_get(var) == other.instance_variable_get(var)
            end
          end
        end

        ##
        # @return [String] Row key.
        #
        attr_accessor :key

        ##
        # @return [Hash{String => Array<Google::Cloud::Bigtable::Row::Cell>}] Row cells.
        #
        attr_accessor :cells

        ##
        # Creates a flat row object.
        #
        # @param key [String] Row key name.
        #
        def initialize key = nil
          @key = key
          @cells = Hash.new { |h, k| h[k] = [] }
        end

        ##
        # List of column families names.
        #
        # @return [Array<String>]
        #
        def column_families
          @cells.keys
        end

        # @private
        #
        # FlatRow object comparator.
        #
        # @return [Boolean]
        #
        def == other
          return false unless self.class == other.class
          return false if key != other.key || column_families != other.column_families

          cells.all? do |family, list|
            list == other.cells[family]
          end
        end
      end
    end
  end
end
