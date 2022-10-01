# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/bigquery/migration/v2/translation_config.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/bigquery/migration/v2/translation_config.proto", :syntax => :proto3) do
    add_message "google.cloud.bigquery.migration.v2.TranslationConfigDetails" do
      optional :source_dialect, :message, 3, "google.cloud.bigquery.migration.v2.Dialect"
      optional :target_dialect, :message, 4, "google.cloud.bigquery.migration.v2.Dialect"
      optional :source_env, :message, 6, "google.cloud.bigquery.migration.v2.SourceEnv"
      oneof :source_location do
        optional :gcs_source_path, :string, 1
      end
      oneof :target_location do
        optional :gcs_target_path, :string, 2
      end
      oneof :output_name_mapping do
        optional :name_mapping_list, :message, 5, "google.cloud.bigquery.migration.v2.ObjectNameMappingList"
      end
    end
    add_message "google.cloud.bigquery.migration.v2.Dialect" do
      oneof :dialect_value do
        optional :bigquery_dialect, :message, 1, "google.cloud.bigquery.migration.v2.BigQueryDialect"
        optional :hiveql_dialect, :message, 2, "google.cloud.bigquery.migration.v2.HiveQLDialect"
        optional :redshift_dialect, :message, 3, "google.cloud.bigquery.migration.v2.RedshiftDialect"
        optional :teradata_dialect, :message, 4, "google.cloud.bigquery.migration.v2.TeradataDialect"
        optional :oracle_dialect, :message, 5, "google.cloud.bigquery.migration.v2.OracleDialect"
        optional :sparksql_dialect, :message, 6, "google.cloud.bigquery.migration.v2.SparkSQLDialect"
        optional :snowflake_dialect, :message, 7, "google.cloud.bigquery.migration.v2.SnowflakeDialect"
        optional :netezza_dialect, :message, 8, "google.cloud.bigquery.migration.v2.NetezzaDialect"
        optional :azure_synapse_dialect, :message, 9, "google.cloud.bigquery.migration.v2.AzureSynapseDialect"
        optional :vertica_dialect, :message, 10, "google.cloud.bigquery.migration.v2.VerticaDialect"
        optional :sql_server_dialect, :message, 11, "google.cloud.bigquery.migration.v2.SQLServerDialect"
        optional :postgresql_dialect, :message, 12, "google.cloud.bigquery.migration.v2.PostgresqlDialect"
        optional :presto_dialect, :message, 13, "google.cloud.bigquery.migration.v2.PrestoDialect"
        optional :mysql_dialect, :message, 14, "google.cloud.bigquery.migration.v2.MySQLDialect"
      end
    end
    add_message "google.cloud.bigquery.migration.v2.BigQueryDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.HiveQLDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.RedshiftDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.TeradataDialect" do
      optional :mode, :enum, 1, "google.cloud.bigquery.migration.v2.TeradataDialect.Mode"
    end
    add_enum "google.cloud.bigquery.migration.v2.TeradataDialect.Mode" do
      value :MODE_UNSPECIFIED, 0
      value :SQL, 1
      value :BTEQ, 2
    end
    add_message "google.cloud.bigquery.migration.v2.OracleDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.SparkSQLDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.SnowflakeDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.NetezzaDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.AzureSynapseDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.VerticaDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.SQLServerDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.PostgresqlDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.PrestoDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.MySQLDialect" do
    end
    add_message "google.cloud.bigquery.migration.v2.ObjectNameMappingList" do
      repeated :name_map, :message, 1, "google.cloud.bigquery.migration.v2.ObjectNameMapping"
    end
    add_message "google.cloud.bigquery.migration.v2.ObjectNameMapping" do
      optional :source, :message, 1, "google.cloud.bigquery.migration.v2.NameMappingKey"
      optional :target, :message, 2, "google.cloud.bigquery.migration.v2.NameMappingValue"
    end
    add_message "google.cloud.bigquery.migration.v2.NameMappingKey" do
      optional :type, :enum, 1, "google.cloud.bigquery.migration.v2.NameMappingKey.Type"
      optional :database, :string, 2
      optional :schema, :string, 3
      optional :relation, :string, 4
      optional :attribute, :string, 5
    end
    add_enum "google.cloud.bigquery.migration.v2.NameMappingKey.Type" do
      value :TYPE_UNSPECIFIED, 0
      value :DATABASE, 1
      value :SCHEMA, 2
      value :RELATION, 3
      value :ATTRIBUTE, 4
      value :RELATION_ALIAS, 5
      value :ATTRIBUTE_ALIAS, 6
      value :FUNCTION, 7
    end
    add_message "google.cloud.bigquery.migration.v2.NameMappingValue" do
      optional :database, :string, 1
      optional :schema, :string, 2
      optional :relation, :string, 3
      optional :attribute, :string, 4
    end
    add_message "google.cloud.bigquery.migration.v2.SourceEnv" do
      optional :default_database, :string, 1
      repeated :schema_search_path, :string, 2
    end
  end
end

module Google
  module Cloud
    module Bigquery
      module Migration
        module V2
          TranslationConfigDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.TranslationConfigDetails").msgclass
          Dialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.Dialect").msgclass
          BigQueryDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.BigQueryDialect").msgclass
          HiveQLDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.HiveQLDialect").msgclass
          RedshiftDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.RedshiftDialect").msgclass
          TeradataDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.TeradataDialect").msgclass
          TeradataDialect::Mode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.TeradataDialect.Mode").enummodule
          OracleDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.OracleDialect").msgclass
          SparkSQLDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.SparkSQLDialect").msgclass
          SnowflakeDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.SnowflakeDialect").msgclass
          NetezzaDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.NetezzaDialect").msgclass
          AzureSynapseDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.AzureSynapseDialect").msgclass
          VerticaDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.VerticaDialect").msgclass
          SQLServerDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.SQLServerDialect").msgclass
          PostgresqlDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.PostgresqlDialect").msgclass
          PrestoDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.PrestoDialect").msgclass
          MySQLDialect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.MySQLDialect").msgclass
          ObjectNameMappingList = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.ObjectNameMappingList").msgclass
          ObjectNameMapping = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.ObjectNameMapping").msgclass
          NameMappingKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.NameMappingKey").msgclass
          NameMappingKey::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.NameMappingKey.Type").enummodule
          NameMappingValue = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.NameMappingValue").msgclass
          SourceEnv = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.migration.v2.SourceEnv").msgclass
        end
      end
    end
  end
end