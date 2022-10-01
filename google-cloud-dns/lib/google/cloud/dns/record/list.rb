# Copyright 2015 Google LLC
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


require "delegate"

module Google
  module Cloud
    module Dns
      class Record
        ##
        # Record::List is a special case Array with additional values.
        class List < DelegateClass(::Array)
          ##
          # If not empty, indicates that there are more records that match
          # the request and this value should be passed to continue.
          attr_accessor :token

          ##
          # @private Create a new Record::List with an array of Record
          # instances.
          def initialize arr = []
            super arr
          end

          ##
          # Whether there a next page of records.
          #
          # @return [Boolean]
          #
          # @example
          #   require "google/cloud/dns"
          #
          #   dns = Google::Cloud::Dns.new
          #   zone = dns.zone "example-com"
          #
          #   records = zone.records "example.com."
          #   if records.next?
          #     next_records = records.next
          #   end
          #
          def next?
            !token.nil?
          end

          ##
          # Retrieve the next page of records.
          #
          # @return [Record::List]
          #
          # @example
          #   require "google/cloud/dns"
          #
          #   dns = Google::Cloud::Dns.new
          #   zone = dns.zone "example-com"
          #
          #   records = zone.records "example.com."
          #   if records.next?
          #     next_records = records.next
          #   end
          #
          def next
            return nil unless next?
            ensure_zone!
            @zone.records @name, @type, token: token, max: @max
          end

          ##
          # Retrieves remaining results by repeatedly invoking {#next} until
          # {#next?} returns `false`. Calls the given block once for each
          # result, which is passed as the argument to the block.
          #
          # An Enumerator is returned if no block is given.
          #
          # This method will make repeated API calls until all remaining results
          # are retrieved. (Unlike `#each`, for example, which merely iterates
          # over the results returned by a single API call.) Use with caution.
          #
          # @param [Integer] request_limit The upper limit of API requests to
          #   make to load all records. Default is no limit.
          # @yield [record] The block for accessing each record.
          # @yieldparam [Record] record The record object.
          #
          # @return [Enumerator]
          #
          # @example Iterating each record by passing a block:
          #   require "google/cloud/dns"
          #
          #   dns = Google::Cloud::Dns.new
          #   zone = dns.zone "example-com"
          #   records = zone.records "example.com."
          #
          #   records.all do |record|
          #     puts record.name
          #   end
          #
          # @example Using the enumerator by not passing a block:
          #   require "google/cloud/dns"
          #
          #   dns = Google::Cloud::Dns.new
          #   zone = dns.zone "example-com"
          #   records = zone.records "example.com."
          #
          #   all_names = records.all.map do |record|
          #     record.name
          #   end
          #
          # @example Limit the number of API calls made:
          #   require "google/cloud/dns"
          #
          #   dns = Google::Cloud::Dns.new
          #   zone = dns.zone "example-com"
          #   records = zone.records "example.com."
          #
          #   records.all(request_limit: 10) do |record|
          #     puts record.name
          #   end
          #
          def all request_limit: nil, &block
            request_limit = request_limit.to_i if request_limit
            unless block_given?
              return enum_for :all, request_limit: request_limit
            end
            results = self
            loop do
              results.each(&block)
              if request_limit
                request_limit -= 1
                break if request_limit.negative?
              end
              break unless results.next?
              results = results.next
            end
          end

          ##
          # @private New Records::List from a response object.
          def self.from_gapi gapi, zone, name = nil, type = nil, max = nil
            records = new(Array(gapi.rrsets).map do |g|
              Record.from_gapi g
            end)
            records.instance_variable_set :@token, gapi.next_page_token
            records.instance_variable_set :@zone,  zone
            records.instance_variable_set :@name,  name
            records.instance_variable_set :@type,  type
            records.instance_variable_set :@max,   max
            records
          end

          protected

          ##
          # Raise an error unless an active connection is available.
          def ensure_zone!
            raise "Must have active connection" unless @zone
          end
        end
      end
    end
  end
end
