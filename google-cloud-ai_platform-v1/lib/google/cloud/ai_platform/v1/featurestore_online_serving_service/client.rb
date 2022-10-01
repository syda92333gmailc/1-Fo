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

require "google/cloud/errors"
require "google/cloud/aiplatform/v1/featurestore_online_service_pb"
require "google/cloud/location"
require "google/iam/v1"

module Google
  module Cloud
    module AIPlatform
      module V1
        module FeaturestoreOnlineServingService
          ##
          # Client for the FeaturestoreOnlineServingService service.
          #
          # A service for serving online feature values.
          #
          class Client
            include Paths

            # @private
            attr_reader :featurestore_online_serving_service_stub

            ##
            # Configure the FeaturestoreOnlineServingService Client class.
            #
            # See {::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @example
            #
            #   # Modify the configuration for all FeaturestoreOnlineServingService clients
            #   ::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.configure do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                namespace = ["Google", "Cloud", "AIPlatform", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const.respond_to? :configure
                                  namespace.pop
                                end
                default_config = Client::Configuration.new parent_config

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the FeaturestoreOnlineServingService Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new FeaturestoreOnlineServingService client object.
            #
            # @example
            #
            #   # Create a client using the default configuration
            #   client = ::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.new
            #
            #   # Create a client using a custom configuration
            #   client = ::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.new do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the FeaturestoreOnlineServingService client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/cloud/aiplatform/v1/featurestore_online_service_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              # Use self-signed JWT if the endpoint is unchanged from default,
              # but only if the default endpoint does not have a region prefix.
              enable_self_signed_jwt = @config.endpoint == Client.configure.endpoint &&
                                       !@config.endpoint.split(".").first.include?("-")
              credentials ||= Credentials.default scope: @config.scope,
                                                  enable_self_signed_jwt: enable_self_signed_jwt
              if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end
              @quota_project_id = @config.quota_project
              @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

              @location_client = Google::Cloud::Location::Locations::Client.new do |config|
                config.credentials = credentials
                config.quota_project = @quota_project_id
                config.endpoint = @config.endpoint
              end

              @iam_policy_client = Google::Iam::V1::IAMPolicy::Client.new do |config|
                config.credentials = credentials
                config.quota_project = @quota_project_id
                config.endpoint = @config.endpoint
              end

              @featurestore_online_serving_service_stub = ::Gapic::ServiceStub.new(
                ::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            ##
            # Get the associated client for mix-in of the Locations.
            #
            # @return [Google::Cloud::Location::Locations::Client]
            #
            attr_reader :location_client

            ##
            # Get the associated client for mix-in of the IAMPolicy.
            #
            # @return [Google::Iam::V1::IAMPolicy::Client]
            #
            attr_reader :iam_policy_client

            # Service calls

            ##
            # Reads Feature values of a specific entity of an EntityType. For reading
            # feature values of multiple entities of an EntityType, please use
            # StreamingReadFeatureValues.
            #
            # @overload read_feature_values(request, options = nil)
            #   Pass arguments to `read_feature_values` via a request object, either of type
            #   {::Google::Cloud::AIPlatform::V1::ReadFeatureValuesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::AIPlatform::V1::ReadFeatureValuesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload read_feature_values(entity_type: nil, entity_id: nil, feature_selector: nil)
            #   Pass arguments to `read_feature_values` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param entity_type [::String]
            #     Required. The resource name of the EntityType for the entity being read.
            #     Value format:
            #     `projects/{project}/locations/{location}/featurestores/{featurestore}/entityTypes/{entityType}`.
            #     For example, for a machine learning model predicting user clicks on a
            #     website, an EntityType ID could be `user`.
            #   @param entity_id [::String]
            #     Required. ID for a specific entity. For example,
            #     for a machine learning model predicting user clicks on a website, an entity
            #     ID could be `user_123`.
            #   @param feature_selector [::Google::Cloud::AIPlatform::V1::FeatureSelector, ::Hash]
            #     Required. Selector choosing Features of the target EntityType.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::AIPlatform::V1::ReadFeatureValuesResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::AIPlatform::V1::ReadFeatureValuesResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/cloud/ai_platform/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Cloud::AIPlatform::V1::ReadFeatureValuesRequest.new
            #
            #   # Call the read_feature_values method.
            #   result = client.read_feature_values request
            #
            #   # The returned object is of type Google::Cloud::AIPlatform::V1::ReadFeatureValuesResponse.
            #   p result
            #
            def read_feature_values request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::AIPlatform::V1::ReadFeatureValuesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.read_feature_values.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::AIPlatform::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.entity_type
                header_params["entity_type"] = request.entity_type
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.read_feature_values.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.read_feature_values.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @featurestore_online_serving_service_stub.call_rpc :read_feature_values, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Reads Feature values for multiple entities. Depending on their size, data
            # for different entities may be broken
            # up across multiple responses.
            #
            # @overload streaming_read_feature_values(request, options = nil)
            #   Pass arguments to `streaming_read_feature_values` via a request object, either of type
            #   {::Google::Cloud::AIPlatform::V1::StreamingReadFeatureValuesRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::AIPlatform::V1::StreamingReadFeatureValuesRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload streaming_read_feature_values(entity_type: nil, entity_ids: nil, feature_selector: nil)
            #   Pass arguments to `streaming_read_feature_values` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param entity_type [::String]
            #     Required. The resource name of the entities' type.
            #     Value format:
            #     `projects/{project}/locations/{location}/featurestores/{featurestore}/entityTypes/{entityType}`.
            #     For example,
            #     for a machine learning model predicting user clicks on a website, an
            #     EntityType ID could be `user`.
            #   @param entity_ids [::Array<::String>]
            #     Required. IDs of entities to read Feature values of. The maximum number of IDs is
            #     100. For example, for a machine learning model predicting user clicks on a
            #     website, an entity ID could be `user_123`.
            #   @param feature_selector [::Google::Cloud::AIPlatform::V1::FeatureSelector, ::Hash]
            #     Required. Selector choosing Features of the target EntityType. Feature IDs will be
            #     deduplicated.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Enumerable<::Google::Cloud::AIPlatform::V1::ReadFeatureValuesResponse>]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Enumerable<::Google::Cloud::AIPlatform::V1::ReadFeatureValuesResponse>]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/cloud/ai_platform/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Cloud::AIPlatform::V1::StreamingReadFeatureValuesRequest.new
            #
            #   # Call the streaming_read_feature_values method.
            #   result = client.streaming_read_feature_values request
            #
            #   # The returned object is a streamed enumerable yielding elements of
            #   # type ::Google::Cloud::AIPlatform::V1::ReadFeatureValuesResponse.
            #   result.each do |response|
            #     p response
            #   end
            #
            def streaming_read_feature_values request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::AIPlatform::V1::StreamingReadFeatureValuesRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.streaming_read_feature_values.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::AIPlatform::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.entity_type
                header_params["entity_type"] = request.entity_type
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.streaming_read_feature_values.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.streaming_read_feature_values.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @featurestore_online_serving_service_stub.call_rpc :streaming_read_feature_values, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the FeaturestoreOnlineServingService API.
            #
            # This class represents the configuration for FeaturestoreOnlineServingService,
            # providing control over timeouts, retry behavior, logging, transport
            # parameters, and other low-level controls. Certain parameters can also be
            # applied individually to specific RPCs. See
            # {::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client::Configuration::Rpcs}
            # for a list of RPCs that can be configured independently.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # @example
            #
            #   # Modify the global config, setting the timeout for
            #   # read_feature_values to 20 seconds,
            #   # and all remaining timeouts to 10 seconds.
            #   ::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.configure do |config|
            #     config.timeout = 10.0
            #     config.rpcs.read_feature_values.timeout = 20.0
            #   end
            #
            #   # Apply the above configuration only to a new client.
            #   client = ::Google::Cloud::AIPlatform::V1::FeaturestoreOnlineServingService::Client.new do |config|
            #     config.timeout = 10.0
            #     config.rpcs.read_feature_values.timeout = 20.0
            #   end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"aiplatform.googleapis.com"`.
            #   @return [::String]
            # @!attribute [rw] credentials
            #   Credentials to send with calls. You may provide any of the following types:
            #    *  (`String`) The path to a service account key file in JSON format
            #    *  (`Hash`) A service account key as a Hash
            #    *  (`Google::Auth::Credentials`) A googleauth credentials object
            #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
            #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
            #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
            #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
            #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
            #    *  (`nil`) indicating no credentials
            #   @return [::Object]
            # @!attribute [rw] scope
            #   The OAuth scopes
            #   @return [::Array<::String>]
            # @!attribute [rw] lib_name
            #   The library name as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] lib_version
            #   The library version as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] channel_args
            #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
            #   `GRPC::Core::Channel` object is provided as the credential.
            #   @return [::Hash]
            # @!attribute [rw] interceptors
            #   An array of interceptors that are run before calls are executed.
            #   @return [::Array<::GRPC::ClientInterceptor>]
            # @!attribute [rw] timeout
            #   The call timeout in seconds.
            #   @return [::Numeric]
            # @!attribute [rw] metadata
            #   Additional gRPC headers to be sent with the call.
            #   @return [::Hash{::Symbol=>::String}]
            # @!attribute [rw] retry_policy
            #   The retry policy. The value is a hash with the following keys:
            #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
            #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
            #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
            #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
            #       trigger a retry.
            #   @return [::Hash]
            # @!attribute [rw] quota_project
            #   A separate project against which to charge quota.
            #   @return [::String]
            #
            class Configuration
              extend ::Gapic::Config

              config_attr :endpoint,      "aiplatform.googleapis.com", ::String
              config_attr :credentials,   nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,         nil, ::String, ::Array, nil
              config_attr :lib_name,      nil, ::String, nil
              config_attr :lib_version,   nil, ::String, nil
              config_attr(:channel_args,  { "grpc.service_config_disable_resolution" => 1 }, ::Hash, nil)
              config_attr :interceptors,  nil, ::Array, nil
              config_attr :timeout,       nil, ::Numeric, nil
              config_attr :metadata,      nil, ::Hash, nil
              config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
              config_attr :quota_project, nil, ::String, nil

              # @private
              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              ##
              # Configurations for individual RPCs
              # @return [Rpcs]
              #
              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the FeaturestoreOnlineServingService API.
              #
              # Includes fields providing the configuration for each RPC in this service.
              # Each configuration object is of type `Gapic::Config::Method` and includes
              # the following configuration fields:
              #
              #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
              #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
              #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
              #     include the following keys:
              #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #         trigger a retry.
              #
              class Rpcs
                ##
                # RPC-specific configuration for `read_feature_values`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :read_feature_values
                ##
                # RPC-specific configuration for `streaming_read_feature_values`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :streaming_read_feature_values

                # @private
                def initialize parent_rpcs = nil
                  read_feature_values_config = parent_rpcs.read_feature_values if parent_rpcs.respond_to? :read_feature_values
                  @read_feature_values = ::Gapic::Config::Method.new read_feature_values_config
                  streaming_read_feature_values_config = parent_rpcs.streaming_read_feature_values if parent_rpcs.respond_to? :streaming_read_feature_values
                  @streaming_read_feature_values = ::Gapic::Config::Method.new streaming_read_feature_values_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
