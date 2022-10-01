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


module Google
  module Cloud
    module Bigquery
      module Storage
        module V1
          # Information about the ReadSession.
          # @!attribute [r] name
          #   @return [::String]
          #     Output only. Unique identifier for the session, in the form
          #     `projects/{project_id}/locations/{location}/sessions/{session_id}`.
          # @!attribute [r] expire_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Output only. Time at which the session becomes invalid. After this time, subsequent
          #     requests to read this Session will return errors. The expire_time is
          #     automatically assigned and currently cannot be specified or updated.
          # @!attribute [rw] data_format
          #   @return [::Google::Cloud::Bigquery::Storage::V1::DataFormat]
          #     Immutable. Data format of the output data. DATA_FORMAT_UNSPECIFIED not supported.
          # @!attribute [r] avro_schema
          #   @return [::Google::Cloud::Bigquery::Storage::V1::AvroSchema]
          #     Output only. Avro schema.
          # @!attribute [r] arrow_schema
          #   @return [::Google::Cloud::Bigquery::Storage::V1::ArrowSchema]
          #     Output only. Arrow schema.
          # @!attribute [rw] table
          #   @return [::String]
          #     Immutable. Table that this ReadSession is reading from, in the form
          #     `projects/{project_id}/datasets/{dataset_id}/tables/{table_id}`
          # @!attribute [rw] table_modifiers
          #   @return [::Google::Cloud::Bigquery::Storage::V1::ReadSession::TableModifiers]
          #     Optional. Any modifiers which are applied when reading from the specified table.
          # @!attribute [rw] read_options
          #   @return [::Google::Cloud::Bigquery::Storage::V1::ReadSession::TableReadOptions]
          #     Optional. Read options for this session (e.g. column selection, filters).
          # @!attribute [r] streams
          #   @return [::Array<::Google::Cloud::Bigquery::Storage::V1::ReadStream>]
          #     Output only. A list of streams created with the session.
          #
          #     At least one stream is created with the session. In the future, larger
          #     request_stream_count values *may* result in this list being unpopulated,
          #     in that case, the user will need to use a List method to get the streams
          #     instead, which is not yet available.
          # @!attribute [r] estimated_total_bytes_scanned
          #   @return [::Integer]
          #     Output only. An estimate on the number of bytes this session will scan when
          #     all streams are completely consumed. This estimate is based on
          #     metadata from the table which might be incomplete or stale.
          # @!attribute [rw] trace_id
          #   @return [::String]
          #     Optional. ID set by client to annotate a session identity.  This does not need
          #     to be strictly unique, but instead the same ID should be used to group
          #     logically connected sessions (e.g. All using the same ID for all sessions
          #     needed to complete a Spark SQL query is reasonable).
          #
          #     Maximum length is 256 bytes.
          class ReadSession
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Additional attributes when reading a table.
            # @!attribute [rw] snapshot_time
            #   @return [::Google::Protobuf::Timestamp]
            #     The snapshot time of the table. If not set, interpreted as now.
            class TableModifiers
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # Options dictating how we read a table.
            # @!attribute [rw] selected_fields
            #   @return [::Array<::String>]
            #     Optional. The names of the fields in the table to be returned. If no
            #     field names are specified, then all fields in the table are returned.
            #
            #     Nested fields -- the child elements of a STRUCT field -- can be selected
            #     individually using their fully-qualified names, and will be returned as
            #     record fields containing only the selected nested fields. If a STRUCT
            #     field is specified in the selected fields list, all of the child elements
            #     will be returned.
            #
            #     As an example, consider a table with the following schema:
            #
            #       {
            #           "name": "struct_field",
            #           "type": "RECORD",
            #           "mode": "NULLABLE",
            #           "fields": [
            #               {
            #                   "name": "string_field1",
            #                   "type": "STRING",
            #     .              "mode": "NULLABLE"
            #               },
            #               {
            #                   "name": "string_field2",
            #                   "type": "STRING",
            #                   "mode": "NULLABLE"
            #               }
            #           ]
            #       }
            #
            #     Specifying "struct_field" in the selected fields list will result in a
            #     read session schema with the following logical structure:
            #
            #       struct_field {
            #           string_field1
            #           string_field2
            #       }
            #
            #     Specifying "struct_field.string_field1" in the selected fields list will
            #     result in a read session schema with the following logical structure:
            #
            #       struct_field {
            #           string_field1
            #       }
            #
            #     The order of the fields in the read session schema is derived from the
            #     table schema and does not correspond to the order in which the fields are
            #     specified in this list.
            # @!attribute [rw] row_restriction
            #   @return [::String]
            #     SQL text filtering statement, similar to a WHERE clause in a query.
            #     Aggregates are not supported.
            #
            #     Examples: "int_field > 5"
            #               "date_field = CAST('2014-9-27' as DATE)"
            #               "nullable_field is not NULL"
            #               "st_equals(geo_field, st_geofromtext("POINT(2, 2)"))"
            #               "numeric_field BETWEEN 1.0 AND 5.0"
            #
            #     Restricted to a maximum length for 1 MB.
            # @!attribute [rw] arrow_serialization_options
            #   @return [::Google::Cloud::Bigquery::Storage::V1::ArrowSerializationOptions]
            #     Optional. Options specific to the Apache Arrow output format.
            # @!attribute [rw] avro_serialization_options
            #   @return [::Google::Cloud::Bigquery::Storage::V1::AvroSerializationOptions]
            #     Optional. Options specific to the Apache Avro output format
            class TableReadOptions
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end

          # Information about a single stream that gets data out of the storage system.
          # Most of the information about `ReadStream` instances is aggregated, making
          # `ReadStream` lightweight.
          # @!attribute [r] name
          #   @return [::String]
          #     Output only. Name of the stream, in the form
          #     `projects/{project_id}/locations/{location}/sessions/{session_id}/streams/{stream_id}`.
          class ReadStream
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end

          # Information about a single stream that gets data inside the storage system.
          # @!attribute [r] name
          #   @return [::String]
          #     Output only. Name of the stream, in the form
          #     `projects/{project}/datasets/{dataset}/tables/{table}/streams/{stream}`.
          # @!attribute [rw] type
          #   @return [::Google::Cloud::Bigquery::Storage::V1::WriteStream::Type]
          #     Immutable. Type of the stream.
          # @!attribute [r] create_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Output only. Create time of the stream. For the _default stream, this is the
          #     creation_time of the table.
          # @!attribute [r] commit_time
          #   @return [::Google::Protobuf::Timestamp]
          #     Output only. Commit time of the stream.
          #     If a stream is of `COMMITTED` type, then it will have a commit_time same as
          #     `create_time`. If the stream is of `PENDING` type, empty commit_time
          #     means it is not committed.
          # @!attribute [r] table_schema
          #   @return [::Google::Cloud::Bigquery::Storage::V1::TableSchema]
          #     Output only. The schema of the destination table. It is only returned in
          #     `CreateWriteStream` response. Caller should generate data that's
          #     compatible with this schema to send in initial `AppendRowsRequest`.
          #     The table schema could go out of date during the life time of the stream.
          # @!attribute [rw] write_mode
          #   @return [::Google::Cloud::Bigquery::Storage::V1::WriteStream::WriteMode]
          #     Immutable. Mode of the stream.
          # @!attribute [rw] location
          #   @return [::String]
          #     Immutable. The geographic location where the stream's dataset resides. See
          #     https://cloud.google.com/bigquery/docs/locations for supported
          #     locations.
          class WriteStream
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # Type enum of the stream.
            module Type
              # Unknown type.
              TYPE_UNSPECIFIED = 0

              # Data will commit automatically and appear as soon as the write is
              # acknowledged.
              COMMITTED = 1

              # Data is invisible until the stream is committed.
              PENDING = 2

              # Data is only visible up to the offset to which it was flushed.
              BUFFERED = 3
            end

            # Mode enum of the stream.
            module WriteMode
              # Unknown type.
              WRITE_MODE_UNSPECIFIED = 0

              # Insert new records into the table.
              # It is the default value if customers do not specify it.
              INSERT = 1
            end
          end

          # Data format for input or output data.
          module DataFormat
            # Data format is unspecified.
            DATA_FORMAT_UNSPECIFIED = 0

            # Avro is a standard open source row based file format.
            # See https://avro.apache.org/ for more details.
            AVRO = 1

            # Arrow is a standard open source column-based message format.
            # See https://arrow.apache.org/ for more details.
            ARROW = 2
          end

          # WriteStreamView is a view enum that controls what details about a write
          # stream should be returned.
          module WriteStreamView
            # The default / unset value.
            WRITE_STREAM_VIEW_UNSPECIFIED = 0

            # The BASIC projection returns basic metadata about a write stream.  The
            # basic view does not include schema information.  This is the default view
            # returned by GetWriteStream.
            BASIC = 1

            # The FULL projection returns all available write stream metadata, including
            # the schema.  CreateWriteStream returns the full projection of write stream
            # metadata.
            FULL = 2
          end
        end
      end
    end
  end
end