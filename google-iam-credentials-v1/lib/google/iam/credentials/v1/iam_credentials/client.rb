# frozen_string_literal: true

# Copyright 2020 Google LLC
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
require "google/iam/credentials/v1/iamcredentials_pb"

module Google
  module Iam
    module Credentials
      module V1
        module IAMCredentials
          ##
          # Client for the IAMCredentials service.
          #
          # A service account is a special type of Google account that belongs to your
          # application or a virtual machine (VM), instead of to an individual end user.
          # Your application assumes the identity of the service account to call Google
          # APIs, so that the users aren't directly involved.
          #
          # Service account credentials are used to temporarily assume the identity
          # of the service account. Supported credential types include OAuth 2.0 access
          # tokens, OpenID Connect ID tokens, self-signed JSON Web Tokens (JWTs), and
          # more.
          #
          class Client
            include Paths

            # @private
            attr_reader :iam_credentials_stub

            ##
            # Configure the IAMCredentials Client class.
            #
            # See {::Google::Iam::Credentials::V1::IAMCredentials::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @example
            #
            #   # Modify the configuration for all IAMCredentials clients
            #   ::Google::Iam::Credentials::V1::IAMCredentials::Client.configure do |config|
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
                namespace = ["Google", "Iam", "Credentials", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const.respond_to? :configure
                                  namespace.pop
                                end
                default_config = Client::Configuration.new parent_config

                default_config.rpcs.generate_access_token.timeout = 60.0
                default_config.rpcs.generate_access_token.retry_policy = {
                  initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [14, 4]
                }

                default_config.rpcs.generate_id_token.timeout = 60.0
                default_config.rpcs.generate_id_token.retry_policy = {
                  initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [14, 4]
                }

                default_config.rpcs.sign_blob.timeout = 60.0
                default_config.rpcs.sign_blob.retry_policy = {
                  initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [14, 4]
                }

                default_config.rpcs.sign_jwt.timeout = 60.0
                default_config.rpcs.sign_jwt.retry_policy = {
                  initial_delay: 0.1, max_delay: 60.0, multiplier: 1.3, retry_codes: [14, 4]
                }

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the IAMCredentials Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Iam::Credentials::V1::IAMCredentials::Client::Configuration}
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
            # Create a new IAMCredentials client object.
            #
            # @example
            #
            #   # Create a client using the default configuration
            #   client = ::Google::Iam::Credentials::V1::IAMCredentials::Client.new
            #
            #   # Create a client using a custom configuration
            #   client = ::Google::Iam::Credentials::V1::IAMCredentials::Client.new do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the IAMCredentials client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/iam/credentials/v1/iamcredentials_services_pb"

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

              @iam_credentials_stub = ::Gapic::ServiceStub.new(
                ::Google::Iam::Credentials::V1::IAMCredentials::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            # Service calls

            ##
            # Generates an OAuth 2.0 access token for a service account.
            #
            # @overload generate_access_token(request, options = nil)
            #   Pass arguments to `generate_access_token` via a request object, either of type
            #   {::Google::Iam::Credentials::V1::GenerateAccessTokenRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::Credentials::V1::GenerateAccessTokenRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload generate_access_token(name: nil, delegates: nil, scope: nil, lifetime: nil)
            #   Pass arguments to `generate_access_token` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param name [::String]
            #     Required. The resource name of the service account for which the credentials
            #     are requested, in the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param delegates [::Array<::String>]
            #     The sequence of service accounts in a delegation chain. Each service
            #     account must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on its next service account in the chain. The last service account in the
            #     chain must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on the service account that is specified in the `name` field of the
            #     request.
            #
            #     The delegates must have the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param scope [::Array<::String>]
            #     Required. Code to identify the scopes to be included in the OAuth 2.0 access token.
            #     See https://developers.google.com/identity/protocols/googlescopes for more
            #     information.
            #     At least one value required.
            #   @param lifetime [::Google::Protobuf::Duration, ::Hash]
            #     The desired lifetime duration of the access token in seconds.
            #     Must be set to a value less than or equal to 3600 (1 hour). If a value is
            #     not specified, the token's lifetime will be set to a default value of one
            #     hour.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::Credentials::V1::GenerateAccessTokenResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::Credentials::V1::GenerateAccessTokenResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/iam/credentials/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Iam::Credentials::V1::IAMCredentials::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Iam::Credentials::V1::GenerateAccessTokenRequest.new
            #
            #   # Call the generate_access_token method.
            #   result = client.generate_access_token request
            #
            #   # The returned object is of type Google::Iam::Credentials::V1::GenerateAccessTokenResponse.
            #   p result
            #
            def generate_access_token request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::Credentials::V1::GenerateAccessTokenRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.generate_access_token.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Iam::Credentials::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.name
                header_params["name"] = request.name
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.generate_access_token.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.generate_access_token.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @iam_credentials_stub.call_rpc :generate_access_token, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Generates an OpenID Connect ID token for a service account.
            #
            # @overload generate_id_token(request, options = nil)
            #   Pass arguments to `generate_id_token` via a request object, either of type
            #   {::Google::Iam::Credentials::V1::GenerateIdTokenRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::Credentials::V1::GenerateIdTokenRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload generate_id_token(name: nil, delegates: nil, audience: nil, include_email: nil)
            #   Pass arguments to `generate_id_token` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param name [::String]
            #     Required. The resource name of the service account for which the credentials
            #     are requested, in the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param delegates [::Array<::String>]
            #     The sequence of service accounts in a delegation chain. Each service
            #     account must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on its next service account in the chain. The last service account in the
            #     chain must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on the service account that is specified in the `name` field of the
            #     request.
            #
            #     The delegates must have the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param audience [::String]
            #     Required. The audience for the token, such as the API or account that this token
            #     grants access to.
            #   @param include_email [::Boolean]
            #     Include the service account email in the token. If set to `true`, the
            #     token will contain `email` and `email_verified` claims.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::Credentials::V1::GenerateIdTokenResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::Credentials::V1::GenerateIdTokenResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/iam/credentials/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Iam::Credentials::V1::IAMCredentials::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Iam::Credentials::V1::GenerateIdTokenRequest.new
            #
            #   # Call the generate_id_token method.
            #   result = client.generate_id_token request
            #
            #   # The returned object is of type Google::Iam::Credentials::V1::GenerateIdTokenResponse.
            #   p result
            #
            def generate_id_token request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::Credentials::V1::GenerateIdTokenRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.generate_id_token.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Iam::Credentials::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.name
                header_params["name"] = request.name
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.generate_id_token.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.generate_id_token.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @iam_credentials_stub.call_rpc :generate_id_token, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Signs a blob using a service account's system-managed private key.
            #
            # @overload sign_blob(request, options = nil)
            #   Pass arguments to `sign_blob` via a request object, either of type
            #   {::Google::Iam::Credentials::V1::SignBlobRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::Credentials::V1::SignBlobRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload sign_blob(name: nil, delegates: nil, payload: nil)
            #   Pass arguments to `sign_blob` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param name [::String]
            #     Required. The resource name of the service account for which the credentials
            #     are requested, in the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param delegates [::Array<::String>]
            #     The sequence of service accounts in a delegation chain. Each service
            #     account must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on its next service account in the chain. The last service account in the
            #     chain must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on the service account that is specified in the `name` field of the
            #     request.
            #
            #     The delegates must have the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param payload [::String]
            #     Required. The bytes to sign.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::Credentials::V1::SignBlobResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::Credentials::V1::SignBlobResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/iam/credentials/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Iam::Credentials::V1::IAMCredentials::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Iam::Credentials::V1::SignBlobRequest.new
            #
            #   # Call the sign_blob method.
            #   result = client.sign_blob request
            #
            #   # The returned object is of type Google::Iam::Credentials::V1::SignBlobResponse.
            #   p result
            #
            def sign_blob request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::Credentials::V1::SignBlobRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.sign_blob.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Iam::Credentials::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.name
                header_params["name"] = request.name
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.sign_blob.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.sign_blob.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @iam_credentials_stub.call_rpc :sign_blob, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Signs a JWT using a service account's system-managed private key.
            #
            # @overload sign_jwt(request, options = nil)
            #   Pass arguments to `sign_jwt` via a request object, either of type
            #   {::Google::Iam::Credentials::V1::SignJwtRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Iam::Credentials::V1::SignJwtRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload sign_jwt(name: nil, delegates: nil, payload: nil)
            #   Pass arguments to `sign_jwt` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param name [::String]
            #     Required. The resource name of the service account for which the credentials
            #     are requested, in the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param delegates [::Array<::String>]
            #     The sequence of service accounts in a delegation chain. Each service
            #     account must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on its next service account in the chain. The last service account in the
            #     chain must be granted the `roles/iam.serviceAccountTokenCreator` role
            #     on the service account that is specified in the `name` field of the
            #     request.
            #
            #     The delegates must have the following format:
            #     `projects/-/serviceAccounts/{ACCOUNT_EMAIL_OR_UNIQUEID}`. The `-` wildcard
            #     character is required; replacing it with a project ID is invalid.
            #   @param payload [::String]
            #     Required. The JWT payload to sign: a JSON object that contains a JWT Claims Set.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Iam::Credentials::V1::SignJwtResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Iam::Credentials::V1::SignJwtResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            # @example Basic example
            #   require "google/iam/credentials/v1"
            #
            #   # Create a client object. The client can be reused for multiple calls.
            #   client = Google::Iam::Credentials::V1::IAMCredentials::Client.new
            #
            #   # Create a request. To set request fields, pass in keyword arguments.
            #   request = Google::Iam::Credentials::V1::SignJwtRequest.new
            #
            #   # Call the sign_jwt method.
            #   result = client.sign_jwt request
            #
            #   # The returned object is of type Google::Iam::Credentials::V1::SignJwtResponse.
            #   p result
            #
            def sign_jwt request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Iam::Credentials::V1::SignJwtRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.sign_jwt.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Iam::Credentials::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {}
              if request.name
                header_params["name"] = request.name
              end

              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.sign_jwt.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.sign_jwt.retry_policy

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @iam_credentials_stub.call_rpc :sign_jwt, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the IAMCredentials API.
            #
            # This class represents the configuration for IAMCredentials,
            # providing control over timeouts, retry behavior, logging, transport
            # parameters, and other low-level controls. Certain parameters can also be
            # applied individually to specific RPCs. See
            # {::Google::Iam::Credentials::V1::IAMCredentials::Client::Configuration::Rpcs}
            # for a list of RPCs that can be configured independently.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # @example
            #
            #   # Modify the global config, setting the timeout for
            #   # generate_access_token to 20 seconds,
            #   # and all remaining timeouts to 10 seconds.
            #   ::Google::Iam::Credentials::V1::IAMCredentials::Client.configure do |config|
            #     config.timeout = 10.0
            #     config.rpcs.generate_access_token.timeout = 20.0
            #   end
            #
            #   # Apply the above configuration only to a new client.
            #   client = ::Google::Iam::Credentials::V1::IAMCredentials::Client.new do |config|
            #     config.timeout = 10.0
            #     config.rpcs.generate_access_token.timeout = 20.0
            #   end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"iamcredentials.googleapis.com"`.
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

              config_attr :endpoint,      "iamcredentials.googleapis.com", ::String
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
              # Configuration RPC class for the IAMCredentials API.
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
                # RPC-specific configuration for `generate_access_token`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :generate_access_token
                ##
                # RPC-specific configuration for `generate_id_token`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :generate_id_token
                ##
                # RPC-specific configuration for `sign_blob`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :sign_blob
                ##
                # RPC-specific configuration for `sign_jwt`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :sign_jwt

                # @private
                def initialize parent_rpcs = nil
                  generate_access_token_config = parent_rpcs.generate_access_token if parent_rpcs.respond_to? :generate_access_token
                  @generate_access_token = ::Gapic::Config::Method.new generate_access_token_config
                  generate_id_token_config = parent_rpcs.generate_id_token if parent_rpcs.respond_to? :generate_id_token
                  @generate_id_token = ::Gapic::Config::Method.new generate_id_token_config
                  sign_blob_config = parent_rpcs.sign_blob if parent_rpcs.respond_to? :sign_blob
                  @sign_blob = ::Gapic::Config::Method.new sign_blob_config
                  sign_jwt_config = parent_rpcs.sign_jwt if parent_rpcs.respond_to? :sign_jwt
                  @sign_jwt = ::Gapic::Config::Method.new sign_jwt_config

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