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
        # A message representing a Study.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. The name of a study. The study's globally unique identifier.
        #     Format: `projects/{project}/locations/{location}/studies/{study}`
        # @!attribute [rw] display_name
        #   @return [::String]
        #     Required. Describes the Study, default value is empty string.
        # @!attribute [rw] study_spec
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec]
        #     Required. Configuration of the Study.
        # @!attribute [r] state
        #   @return [::Google::Cloud::AIPlatform::V1::Study::State]
        #     Output only. The detailed state of a Study.
        # @!attribute [r] create_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time at which the study was created.
        # @!attribute [r] inactive_reason
        #   @return [::String]
        #     Output only. A human readable reason why the Study is inactive.
        #     This should be empty if a study is ACTIVE or COMPLETED.
        class Study
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Describes the Study state.
          module State
            # The study state is unspecified.
            STATE_UNSPECIFIED = 0

            # The study is active.
            ACTIVE = 1

            # The study is stopped due to an internal error.
            INACTIVE = 2

            # The study is done when the service exhausts the parameter search space
            # or max_trial_count is reached.
            COMPLETED = 3
          end
        end

        # A message representing a Trial. A Trial contains a unique set of Parameters
        # that has been or will be evaluated, along with the objective metrics got by
        # running the Trial.
        # @!attribute [r] name
        #   @return [::String]
        #     Output only. Resource name of the Trial assigned by the service.
        # @!attribute [r] id
        #   @return [::String]
        #     Output only. The identifier of the Trial assigned by the service.
        # @!attribute [r] state
        #   @return [::Google::Cloud::AIPlatform::V1::Trial::State]
        #     Output only. The detailed state of the Trial.
        # @!attribute [r] parameters
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::Trial::Parameter>]
        #     Output only. The parameters of the Trial.
        # @!attribute [r] final_measurement
        #   @return [::Google::Cloud::AIPlatform::V1::Measurement]
        #     Output only. The final measurement containing the objective value.
        # @!attribute [r] measurements
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::Measurement>]
        #     Output only. A list of measurements that are strictly lexicographically
        #     ordered by their induced tuples (steps, elapsed_duration).
        #     These are used for early stopping computations.
        # @!attribute [r] start_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time when the Trial was started.
        # @!attribute [r] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Output only. Time when the Trial's status changed to `SUCCEEDED` or `INFEASIBLE`.
        # @!attribute [r] client_id
        #   @return [::String]
        #     Output only. The identifier of the client that originally requested this Trial.
        #     Each client is identified by a unique client_id. When a client
        #     asks for a suggestion, Vertex AI Vizier will assign it a Trial. The client
        #     should evaluate the Trial, complete it, and report back to Vertex AI
        #     Vizier. If suggestion is asked again by same client_id before the Trial is
        #     completed, the same Trial will be returned. Multiple clients with
        #     different client_ids can ask for suggestions simultaneously, each of them
        #     will get their own Trial.
        # @!attribute [r] infeasible_reason
        #   @return [::String]
        #     Output only. A human readable string describing why the Trial is
        #     infeasible. This is set only if Trial state is `INFEASIBLE`.
        # @!attribute [r] custom_job
        #   @return [::String]
        #     Output only. The CustomJob name linked to the Trial.
        #     It's set for a HyperparameterTuningJob's Trial.
        # @!attribute [r] web_access_uris
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Output only. URIs for accessing [interactive
        #     shells](https://cloud.google.com/vertex-ai/docs/training/monitor-debug-interactive-shell)
        #     (one URI for each training node). Only available if this trial is part of
        #     a {::Google::Cloud::AIPlatform::V1::HyperparameterTuningJob HyperparameterTuningJob} and the job's
        #     {::Google::Cloud::AIPlatform::V1::CustomJobSpec#enable_web_access trial_job_spec.enable_web_access} field
        #     is `true`.
        #
        #     The keys are names of each node used for the trial; for example,
        #     `workerpool0-0` for the primary node, `workerpool1-0` for the first node in
        #     the second worker pool, and `workerpool1-1` for the second node in the
        #     second worker pool.
        #
        #     The values are the URIs for each node's interactive shell.
        class Trial
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # A message representing a parameter to be tuned.
          # @!attribute [r] parameter_id
          #   @return [::String]
          #     Output only. The ID of the parameter. The parameter should be defined in
          #     [StudySpec's Parameters][google.cloud.aiplatform.v1.StudySpec.parameters].
          # @!attribute [r] value
          #   @return [::Google::Protobuf::Value]
          #     Output only. The value of the parameter.
          #     `number_value` will be set if a parameter defined in StudySpec is
          #     in type 'INTEGER', 'DOUBLE' or 'DISCRETE'.
          #     `string_value` will be set if a parameter defined in StudySpec is
          #     in type 'CATEGORICAL'.
          class Parameter
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class WebAccessUrisEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Describes a Trial state.
          module State
            # The Trial state is unspecified.
            STATE_UNSPECIFIED = 0

            # Indicates that a specific Trial has been requested, but it has not yet
            # been suggested by the service.
            REQUESTED = 1

            # Indicates that the Trial has been suggested.
            ACTIVE = 2

            # Indicates that the Trial should stop according to the service.
            STOPPING = 3

            # Indicates that the Trial is completed successfully.
            SUCCEEDED = 4

            # Indicates that the Trial should not be attempted again.
            # The service will set a Trial to INFEASIBLE when it's done but missing
            # the final_measurement.
            INFEASIBLE = 5
          end
        end

        # Represents specification of a Study.
        # @!attribute [rw] decay_curve_stopping_spec
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::DecayCurveAutomatedStoppingSpec]
        #     The automated early stopping spec using decay curve rule.
        # @!attribute [rw] median_automated_stopping_spec
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::MedianAutomatedStoppingSpec]
        #     The automated early stopping spec using median rule.
        # @!attribute [rw] convex_automated_stopping_spec
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ConvexAutomatedStoppingSpec]
        #     The automated early stopping spec using convex stopping rule.
        # @!attribute [rw] metrics
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::StudySpec::MetricSpec>]
        #     Required. Metric specs for the Study.
        # @!attribute [rw] parameters
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec>]
        #     Required. The set of parameters to tune.
        # @!attribute [rw] algorithm
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::Algorithm]
        #     The search algorithm specified for the Study.
        # @!attribute [rw] observation_noise
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ObservationNoise]
        #     The observation noise level of the study.
        #     Currently only supported by the Vertex AI Vizier service. Not supported by
        #     HyperparameterTuningJob or TrainingPipeline.
        # @!attribute [rw] measurement_selection_type
        #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::MeasurementSelectionType]
        #     Describe which measurement selection type will be used
        class StudySpec
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Represents a metric to optimize.
          # @!attribute [rw] metric_id
          #   @return [::String]
          #     Required. The ID of the metric. Must not contain whitespaces and must be unique
          #     amongst all MetricSpecs.
          # @!attribute [rw] goal
          #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::MetricSpec::GoalType]
          #     Required. The optimization goal of the metric.
          class MetricSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # The available types of optimization goals.
            module GoalType
              # Goal Type will default to maximize.
              GOAL_TYPE_UNSPECIFIED = 0

              # Maximize the goal metric.
              MAXIMIZE = 1

              # Minimize the goal metric.
              MINIMIZE = 2
            end
          end

          # Represents a single parameter to optimize.
          # @!attribute [rw] double_value_spec
          #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::DoubleValueSpec]
          #     The value spec for a 'DOUBLE' parameter.
          # @!attribute [rw] integer_value_spec
          #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::IntegerValueSpec]
          #     The value spec for an 'INTEGER' parameter.
          # @!attribute [rw] categorical_value_spec
          #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::CategoricalValueSpec]
          #     The value spec for a 'CATEGORICAL' parameter.
          # @!attribute [rw] discrete_value_spec
          #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::DiscreteValueSpec]
          #     The value spec for a 'DISCRETE' parameter.
          # @!attribute [rw] parameter_id
          #   @return [::String]
          #     Required. The ID of the parameter. Must not contain whitespaces and must be unique
          #     amongst all ParameterSpecs.
          # @!attribute [rw] scale_type
          #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::ScaleType]
          #     How the parameter should be scaled.
          #     Leave unset for `CATEGORICAL` parameters.
          # @!attribute [rw] conditional_parameter_specs
          #   @return [::Array<::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::ConditionalParameterSpec>]
          #     A conditional parameter node is active if the parameter's value matches
          #     the conditional node's parent_value_condition.
          #
          #     If two items in conditional_parameter_specs have the same name, they
          #     must have disjoint parent_value_condition.
          class ParameterSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Value specification for a parameter in `DOUBLE` type.
            # @!attribute [rw] min_value
            #   @return [::Float]
            #     Required. Inclusive minimum value of the parameter.
            # @!attribute [rw] max_value
            #   @return [::Float]
            #     Required. Inclusive maximum value of the parameter.
            # @!attribute [rw] default_value
            #   @return [::Float]
            #     A default value for a `DOUBLE` parameter that is assumed to be a
            #     relatively good starting point.  Unset value signals that there is no
            #     offered starting point.
            #
            #     Currently only supported by the Vertex AI Vizier service. Not supported
            #     by HyperparameterTuningJob or TrainingPipeline.
            class DoubleValueSpec
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Value specification for a parameter in `INTEGER` type.
            # @!attribute [rw] min_value
            #   @return [::Integer]
            #     Required. Inclusive minimum value of the parameter.
            # @!attribute [rw] max_value
            #   @return [::Integer]
            #     Required. Inclusive maximum value of the parameter.
            # @!attribute [rw] default_value
            #   @return [::Integer]
            #     A default value for an `INTEGER` parameter that is assumed to be a
            #     relatively good starting point.  Unset value signals that there is no
            #     offered starting point.
            #
            #     Currently only supported by the Vertex AI Vizier service. Not supported
            #     by HyperparameterTuningJob or TrainingPipeline.
            class IntegerValueSpec
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Value specification for a parameter in `CATEGORICAL` type.
            # @!attribute [rw] values
            #   @return [::Array<::String>]
            #     Required. The list of possible categories.
            # @!attribute [rw] default_value
            #   @return [::String]
            #     A default value for a `CATEGORICAL` parameter that is assumed to be a
            #     relatively good starting point.  Unset value signals that there is no
            #     offered starting point.
            #
            #     Currently only supported by the Vertex AI Vizier service. Not supported
            #     by HyperparameterTuningJob or TrainingPipeline.
            class CategoricalValueSpec
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Value specification for a parameter in `DISCRETE` type.
            # @!attribute [rw] values
            #   @return [::Array<::Float>]
            #     Required. A list of possible values.
            #     The list should be in increasing order and at least 1e-10 apart.
            #     For instance, this parameter might have possible settings of 1.5, 2.5,
            #     and 4.0. This list should not contain more than 1,000 values.
            # @!attribute [rw] default_value
            #   @return [::Float]
            #     A default value for a `DISCRETE` parameter that is assumed to be a
            #     relatively good starting point.  Unset value signals that there is no
            #     offered starting point.  It automatically rounds to the
            #     nearest feasible discrete point.
            #
            #     Currently only supported by the Vertex AI Vizier service. Not supported
            #     by HyperparameterTuningJob or TrainingPipeline.
            class DiscreteValueSpec
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Represents a parameter spec with condition from its parent parameter.
            # @!attribute [rw] parent_discrete_values
            #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::ConditionalParameterSpec::DiscreteValueCondition]
            #     The spec for matching values from a parent parameter of
            #     `DISCRETE` type.
            # @!attribute [rw] parent_int_values
            #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::ConditionalParameterSpec::IntValueCondition]
            #     The spec for matching values from a parent parameter of `INTEGER`
            #     type.
            # @!attribute [rw] parent_categorical_values
            #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec::ConditionalParameterSpec::CategoricalValueCondition]
            #     The spec for matching values from a parent parameter of
            #     `CATEGORICAL` type.
            # @!attribute [rw] parameter_spec
            #   @return [::Google::Cloud::AIPlatform::V1::StudySpec::ParameterSpec]
            #     Required. The spec for a conditional parameter.
            class ConditionalParameterSpec
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods

              # Represents the spec to match discrete values from parent parameter.
              # @!attribute [rw] values
              #   @return [::Array<::Float>]
              #     Required. Matches values of the parent parameter of 'DISCRETE' type.
              #     All values must exist in `discrete_value_spec` of parent parameter.
              #
              #     The Epsilon of the value matching is 1e-10.
              class DiscreteValueCondition
                include ::Google::Protobuf::MessageExts
                extend ::Google::Protobuf::MessageExts::ClassMethods
              end

              # Represents the spec to match integer values from parent parameter.
              # @!attribute [rw] values
              #   @return [::Array<::Integer>]
              #     Required. Matches values of the parent parameter of 'INTEGER' type.
              #     All values must lie in `integer_value_spec` of parent parameter.
              class IntValueCondition
                include ::Google::Protobuf::MessageExts
                extend ::Google::Protobuf::MessageExts::ClassMethods
              end

              # Represents the spec to match categorical values from parent parameter.
              # @!attribute [rw] values
              #   @return [::Array<::String>]
              #     Required. Matches values of the parent parameter of 'CATEGORICAL' type.
              #     All values must exist in `categorical_value_spec` of parent
              #     parameter.
              class CategoricalValueCondition
                include ::Google::Protobuf::MessageExts
                extend ::Google::Protobuf::MessageExts::ClassMethods
              end
            end

            # The type of scaling that should be applied to this parameter.
            module ScaleType
              # By default, no scaling is applied.
              SCALE_TYPE_UNSPECIFIED = 0

              # Scales the feasible space to (0, 1) linearly.
              UNIT_LINEAR_SCALE = 1

              # Scales the feasible space logarithmically to (0, 1). The entire
              # feasible space must be strictly positive.
              UNIT_LOG_SCALE = 2

              # Scales the feasible space "reverse" logarithmically to (0, 1). The
              # result is that values close to the top of the feasible space are spread
              # out more than points near the bottom. The entire feasible space must be
              # strictly positive.
              UNIT_REVERSE_LOG_SCALE = 3
            end
          end

          # The decay curve automated stopping rule builds a Gaussian Process
          # Regressor to predict the final objective value of a Trial based on the
          # already completed Trials and the intermediate measurements of the current
          # Trial. Early stopping is requested for the current Trial if there is very
          # low probability to exceed the optimal value found so far.
          # @!attribute [rw] use_elapsed_duration
          #   @return [::Boolean]
          #     True if {::Google::Cloud::AIPlatform::V1::Measurement#elapsed_duration Measurement.elapsed_duration} is used as the x-axis of each
          #     Trials Decay Curve. Otherwise, {::Google::Cloud::AIPlatform::V1::Measurement#step_count Measurement.step_count} will be used
          #     as the x-axis.
          class DecayCurveAutomatedStoppingSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The median automated stopping rule stops a pending Trial if the Trial's
          # best objective_value is strictly below the median 'performance' of all
          # completed Trials reported up to the Trial's last measurement.
          # Currently, 'performance' refers to the running average of the objective
          # values reported by the Trial in each measurement.
          # @!attribute [rw] use_elapsed_duration
          #   @return [::Boolean]
          #     True if median automated stopping rule applies on
          #     {::Google::Cloud::AIPlatform::V1::Measurement#elapsed_duration Measurement.elapsed_duration}. It means that elapsed_duration
          #     field of latest measurement of current Trial is used to compute median
          #     objective value for each completed Trials.
          class MedianAutomatedStoppingSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Configuration for ConvexAutomatedStoppingSpec.
          # When there are enough completed trials (configured by
          # min_measurement_count), for pending trials with enough measurements and
          # steps, the policy first computes an overestimate of the objective value at
          # max_num_steps according to the slope of the incomplete objective value
          # curve. No prediction can be made if the curve is completely flat. If the
          # overestimation is worse than the best objective value of the completed
          # trials, this pending trial will be early-stopped, but a last measurement
          # will be added to the pending trial with max_num_steps and predicted
          # objective value from the autoregression model.
          # @!attribute [rw] max_step_count
          #   @return [::Integer]
          #     Steps used in predicting the final objective for early stopped trials. In
          #     general, it's set to be the same as the defined steps in training /
          #     tuning. If not defined, it will learn it from the completed trials. When
          #     use_steps is false, this field is set to the maximum elapsed seconds.
          # @!attribute [rw] min_step_count
          #   @return [::Integer]
          #     Minimum number of steps for a trial to complete. Trials which do not have
          #     a measurement with step_count > min_step_count won't be considered for
          #     early stopping. It's ok to set it to 0, and a trial can be early stopped
          #     at any stage. By default, min_step_count is set to be one-tenth of the
          #     max_step_count.
          #     When use_elapsed_duration is true, this field is set to the minimum
          #     elapsed seconds.
          # @!attribute [rw] min_measurement_count
          #   @return [::Integer]
          #     The minimal number of measurements in a Trial.  Early-stopping checks
          #     will not trigger if less than min_measurement_count+1 completed trials or
          #     pending trials with less than min_measurement_count measurements. If not
          #     defined, the default value is 5.
          # @!attribute [rw] learning_rate_parameter_name
          #   @return [::String]
          #     The hyper-parameter name used in the tuning job that stands for learning
          #     rate. Leave it blank if learning rate is not in a parameter in tuning.
          #     The learning_rate is used to estimate the objective value of the ongoing
          #     trial.
          # @!attribute [rw] use_elapsed_duration
          #   @return [::Boolean]
          #     This bool determines whether or not the rule is applied based on
          #     elapsed_secs or steps. If use_elapsed_duration==false, the early stopping
          #     decision is made according to the predicted objective values according to
          #     the target steps. If use_elapsed_duration==true, elapsed_secs is used
          #     instead of steps. Also, in this case, the parameters max_num_steps and
          #     min_num_steps are overloaded to contain max_elapsed_seconds and
          #     min_elapsed_seconds.
          class ConvexAutomatedStoppingSpec
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # The available search algorithms for the Study.
          module Algorithm
            # The default algorithm used by Vertex AI for [hyperparameter
            # tuning](https://cloud.google.com/vertex-ai/docs/training/hyperparameter-tuning-overview)
            # and [Vertex AI Vizier](https://cloud.google.com/vertex-ai/docs/vizier).
            ALGORITHM_UNSPECIFIED = 0

            # Simple grid search within the feasible space. To use grid search,
            # all parameters must be `INTEGER`, `CATEGORICAL`, or `DISCRETE`.
            GRID_SEARCH = 2

            # Simple random search within the feasible space.
            RANDOM_SEARCH = 3
          end

          # Describes the noise level of the repeated observations.
          #
          # "Noisy" means that the repeated observations with the same Trial parameters
          # may lead to different metric evaluations.
          module ObservationNoise
            # The default noise level chosen by Vertex AI.
            OBSERVATION_NOISE_UNSPECIFIED = 0

            # Vertex AI assumes that the objective function is (nearly)
            # perfectly reproducible, and will never repeat the same Trial
            # parameters.
            LOW = 1

            # Vertex AI will estimate the amount of noise in metric
            # evaluations, it may repeat the same Trial parameters more than once.
            HIGH = 2
          end

          # This indicates which measurement to use if/when the service automatically
          # selects the final measurement from previously reported intermediate
          # measurements. Choose this based on two considerations:
          #  A) Do you expect your measurements to monotonically improve?
          #     If so, choose LAST_MEASUREMENT. On the other hand, if you're in a
          #     situation where your system can "over-train" and you expect the
          #     performance to get better for a while but then start declining,
          #     choose BEST_MEASUREMENT.
          #  B) Are your measurements significantly noisy and/or irreproducible?
          #     If so, BEST_MEASUREMENT will tend to be over-optimistic, and it
          #     may be better to choose LAST_MEASUREMENT.
          #  If both or neither of (A) and (B) apply, it doesn't matter which
          #  selection type is chosen.
          module MeasurementSelectionType
            # Will be treated as LAST_MEASUREMENT.
            MEASUREMENT_SELECTION_TYPE_UNSPECIFIED = 0

            # Use the last measurement reported.
            LAST_MEASUREMENT = 1

            # Use the best measurement reported.
            BEST_MEASUREMENT = 2
          end
        end

        # A message representing a Measurement of a Trial. A Measurement contains
        # the Metrics got by executing a Trial using suggested hyperparameter
        # values.
        # @!attribute [r] elapsed_duration
        #   @return [::Google::Protobuf::Duration]
        #     Output only. Time that the Trial has been running at the point of this Measurement.
        # @!attribute [r] step_count
        #   @return [::Integer]
        #     Output only. The number of steps the machine learning model has been trained for.
        #     Must be non-negative.
        # @!attribute [r] metrics
        #   @return [::Array<::Google::Cloud::AIPlatform::V1::Measurement::Metric>]
        #     Output only. A list of metrics got by evaluating the objective functions using suggested
        #     Parameter values.
        class Measurement
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # A message representing a metric in the measurement.
          # @!attribute [r] metric_id
          #   @return [::String]
          #     Output only. The ID of the Metric. The Metric should be defined in
          #     [StudySpec's Metrics][google.cloud.aiplatform.v1.StudySpec.metrics].
          # @!attribute [r] value
          #   @return [::Float]
          #     Output only. The value for this metric.
          class Metric
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end
      end
    end
  end
end