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

require "helper.rb"
require_relative "../../../../conformance/v1/proto/google/cloud/conformance/firestore/v1/tests_pb"

##
# This suite of unit tests is dynamically generated from the contents of
# `conformance/test-suite.binproto`, using the protobuf types defined in
# `conformance/test-definition_pb.rb`, which was manually generated from
# `conformance/test-definition.proto`. See [Protocol Buffers - Ruby Generated
# Code](https://developers.google.com/protocol-buffers/docs/reference/ruby-generated)
# for instructions in case `test-definition.proto` is updated.
#
# This code was adapted from google-cloud-dotnet
# [ProtoTest.cs](https://github.com/GoogleCloudPlatform/google-cloud-dotnet/blob/master/apis/Google.Cloud.Firestore/Google.Cloud.Firestore.Tests/Proto/ProtoTest.cs).
#
class ConformanceTest < MockFirestore
  let(:commit_time) { Time.now }
  let :commit_resp do
    Google::Cloud::Firestore::V1::CommitResponse.new(
      commit_time: Google::Cloud::Firestore::Convert.time_to_timestamp(commit_time),
      write_results: [Google::Cloud::Firestore::V1::WriteResult.new(
        update_time: Google::Cloud::Firestore::Convert.time_to_timestamp(commit_time))]
      )
  end

  def doc_ref_from_path doc_path
    Google::Cloud::Firestore::DocumentReference.from_path doc_path, firestore
  end

  def doc_snap_from_path_and_json_data doc_path, json_data
    Google::Cloud::Firestore::DocumentSnapshot.new.tap do |s|
      s.grpc = Google::Cloud::Firestore::V1::Document.new(
        name: doc_path,
        fields: Google::Cloud::Firestore::Convert.hash_to_fields(data_from_json(json_data))
      )
      s.instance_variable_set :@ref, doc_ref_from_path(doc_path)
    end
  end

  def data_from_json data_json
    convert_values JSON.parse data_json
  end

  def convert_values data
    if data == "Delete"
      firestore.field_delete
    elsif data == "ServerTimestamp"
      firestore.field_server_time
    elsif data == "NaN"
      Float::NAN
    elsif data.is_a? Hash
      Hash[data.map { |k, v| [k, convert_values(v)] }]
    elsif data.is_a? Array
      head, *tail = data
      if head == "ArrayUnion"
        Google::Cloud::Firestore::FieldValue.array_union *convert_values(tail)
      elsif head == "ArrayDelete" || head == "ArrayRemove"
        Google::Cloud::Firestore::FieldValue.array_delete *convert_values(tail)
      else
        data.map { |v| convert_values(v) }
      end
    else
      data
    end
  end
end

class ConformanceCreate < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      if test.is_error
        expect do
          run_conformance_proto test
        end.must_raise ArgumentError
      else
        firestore_mock.expect :commit, commit_resp, commit_args(database: test.request.database, writes: test.request.writes)

        run_conformance_proto test
      end
    end
  end

  def run_conformance_proto test
    doc_ref = doc_ref_from_path test.doc_ref_path
    data = data_from_json test.json_data

    doc_ref.create data
  end
end

class ConformanceSet < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      if test.is_error
        expect do
          run_conformance_proto test
        end.must_raise ArgumentError
      else
        firestore_mock.expect :commit, commit_resp, commit_args(database: test.request.database, writes: test.request.writes)

        run_conformance_proto test
      end
    end
  end

  def run_conformance_proto test
    doc_ref = doc_ref_from_path test.doc_ref_path
    data = data_from_json test.json_data
    merge = if test.option && test.option.all
              true
            elsif test.option && !test.option.fields.empty?
              test.option.fields.map do |fp|
                firestore.field_path fp.field
              end
            end

    doc_ref.set data, merge: merge
  end
end

class ConformanceUpdate < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      if test.precondition && test.precondition.exists
        fail "The ruby implementation does not allow exists on update"
      end

      if test.is_error
        expect do
          run_conformance_proto test
        end.must_raise ArgumentError
      else
        firestore_mock.expect :commit, commit_resp, commit_args(database: test.request.database, writes: test.request.writes)

        run_conformance_proto test
      end
    end
  end

  def run_conformance_proto test
    doc_ref = doc_ref_from_path test.doc_ref_path
    data = data_from_json test.json_data
    update_time = if test.precondition && test.precondition.update_time
                    Time.at(test.precondition.update_time.seconds)
                  end

    doc_ref.update data, update_time: update_time
  end
end

class ConformanceUpdatePaths < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      if test.precondition && test.precondition.exists
        fail "The ruby implementation does not allow exists on update"
      end

      if test.is_error
        expect do
          run_conformance_proto test
        end.must_raise ArgumentError
      else
        firestore_mock.expect :commit, commit_resp, commit_args(database: test.request.database, writes: test.request.writes)

        run_conformance_proto test
      end
    end
  end

  def run_conformance_proto test
    doc_ref = doc_ref_from_path test.doc_ref_path
    update_time = if test.precondition && test.precondition.update_time
                    Time.at(test.precondition.update_time.seconds)
                  end

    data = data_from_field_paths_and_json test.field_paths, test.json_values

    doc_ref.update data, update_time: update_time
  end

  def data_from_field_paths_and_json field_paths, json_values
    raise ArgumentError, "bad test data" if field_paths.size != json_values.size

    hash_args = Hash[field_paths.zip(json_values).map do |field_path, data_json|
      [firestore.field_path(field_path.field), data_from_json(data_json)]
    end]

    raise ArgumentError, "cannot duplicate args when using a hash in ruby" if hash_args.size != field_paths.size

    hash_args
  end
end

class ConformanceDelete < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      doc_ref = doc_ref_from_path test.doc_ref_path
      exists = nil
      update_time = nil
      if test.precondition && test.precondition.exists
        exists = test.precondition.exists
      end
      if test.precondition && test.precondition.update_time
        update_time = Time.at test.precondition.update_time.seconds
      end
      if test.is_error
        expect do
          doc_ref.delete exists: exists, update_time: update_time
        end.must_raise ArgumentError
      else
        firestore_mock.expect :commit, commit_resp, commit_args(database: test.request.database, writes: test.request.writes)

        doc_ref.delete exists: exists, update_time: update_time
      end
    end
  end
end

class ConformanceQuery < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      if test.is_error
        expect do
          build_query test, get_collection_reference(test.coll_path)
        end.must_raise ArgumentError
      else
        query = build_query test, get_collection_reference(test.coll_path)
        assert_equal test.query, query
      end
    end
  end

  def get_collection_reference resource_name
    col_path = resource_name.split("/documents/")[1]
    firestore.col col_path
  end

  def build_query test, col
    test.clauses.each do |clause|
      col = if clause.select
              col.select(clause.select.fields.map(&:field))
            elsif where = clause.where
              field_path = convert_field_path where
              where_value = data_from_json where.json_value
              col.where(field_path, where.op, where_value)
            elsif clause.order_by
              direction = clause.order_by.direction
              col.order convert_field_path(clause.order_by), direction
            elsif clause.offset && clause.offset != 0
              col.offset clause.offset
            elsif  clause.limit && clause.limit != 0
              col.limit clause.limit
            elsif clause.start_at
              col.start_at *convert_cursor(clause.start_at)
            elsif clause.start_after
              col.start_after *convert_cursor(clause.start_after)
            elsif clause.end_at
              col.end_at *convert_cursor(clause.end_at)
            elsif clause.end_before
              col.end_before *convert_cursor(clause.end_before)
            else
              raise "Unexpected Clause state: #{clause.inspect}"
            end
    end
    col.query
  end

  def convert_cursor clause_val
    if clause_val.doc_snapshot
      return [doc_snap_from_path_and_json_data(clause_val.doc_snapshot.path, clause_val.doc_snapshot.json_data)]
    end

    clause_val.json_values.map {|x| data_from_json x }
  end

  def convert_field_path clause_val
    firestore.field_path clause_val.path.field
  end
end

class ConformanceListen < ConformanceTest
  def self.build_test_for description, test, file_path
    define_method("test_#{file_path}: #{description}") do
      # slice responses into groups ending on RESET
      sliced_responses = test.responses.slice_when do |before_response, _after_response|
        before_response.response_type == :target_change &&
          before_response.target_change.target_change_type == :RESET
      end
      # set stub because we can't mock a streaming request/response
      listen_stub = StreamingListenStub.new sliced_responses
      firestore.service.instance_variable_set :@firestore, listen_stub

      query_snapshots = []
      listener = firestore.col("C").order("a").listen do |query_snp|
        query_snapshots << query_snp
      end

      wait_until { query_snapshots.count == test.snapshots.count }

      listener.stop

      _(query_snapshots.count).must_equal test.snapshots.count
      query_snapshots.zip(test.snapshots).each do |ruby_snapshot, proto_snapshot|
        compare_query_snapshot ruby_snapshot, proto_snapshot
      end
    end
  end

  def compare_query_snapshot ruby_snapshot, proto_snapshot
    _(ruby_snapshot.docs.count).must_equal proto_snapshot.docs.count
    _(ruby_snapshot.docs.map(&:path)).must_equal proto_snapshot.docs.map(&:name)
    ruby_snapshot.docs.zip(proto_snapshot.docs).each do |ruby_doc, proto_doc|
      compare_document_snapshot ruby_doc, proto_doc
    end
    _(ruby_snapshot.changes.count).must_equal proto_snapshot.changes.count
  end

  def compare_document_snapshot ruby_snapshot, proto_snapshot
    _(ruby_snapshot.grpc.to_h).must_equal proto_snapshot.to_h
  end
end

Dir.glob("#{__dir__}/../../../../conformance/v1/*.json").each do |file_path|
  test_file = Google::Cloud::Conformance::Firestore::V1::TestFile.decode_json File.read(file_path)
  test_file.tests.each do |wrapper|
    case wrapper.test
      when :get
        next # Google::Cloud::Firestore::V1::GetDocumentRequest is not used.                                                                  x
      when :create
        ConformanceCreate.build_test_for wrapper.description, wrapper.create, file_path
      when :set
        ConformanceSet.build_test_for wrapper.description, wrapper.set, file_path
      when :update
        # The ruby implementation does not allow exists on update, so skip
        next if wrapper.update.precondition && wrapper.update.precondition.exists

        ConformanceUpdate.build_test_for wrapper.description, wrapper.update, file_path
      when :update_paths
        # The ruby implementation does not allow exists on update, so skip
        next if wrapper.update_paths.precondition && wrapper.update_paths.precondition.exists

        ConformanceUpdatePaths.build_test_for wrapper.description, wrapper.update_paths, file_path
      when :delete
        ConformanceDelete.build_test_for wrapper.description, wrapper.delete, file_path
      when :query
        ConformanceQuery.build_test_for wrapper.description, wrapper.query, file_path
      when :listen
        ConformanceListen.build_test_for wrapper.description, wrapper.listen, file_path
      else
        raise "Unexpected test: #{wrapper.inspect}"
    end
  end
end

