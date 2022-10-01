# Copyright 2017 Google LLC
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


require "helper"
require "google/cloud/config"

describe Google::Cloud::Config do
  let(:legacy_config) { Google::Cloud::Config.new [:k1, {k2: [:k3]}] }
  let(:new_config) { Google::Cloud::Config.create }
  let(:checked_config) {
    Google::Cloud::Config.create do |c1|
      c1.add_field! :opt1_int, 1
      c1.add_config! :sub1 do |c2|
        c2.add_field! :opt2_sym, :hi
        c2.add_config! :sub2 do |c3|
          c3.add_field! :opt3_bool, true
          c3.add_field! :opt3_bool_nil, true, allow_nil: true
          c3.add_field! :opt3_enum, :one, enum: [:one, :two, :three]
          c3.add_field! :opt3_regex, "hi", match: /^[a-z]+$/
          c3.add_field! :opt3_class, "hi", match: [String, Symbol]
          c3.add_field! :opt3_default
        end
      end
    end
  }

  describe "#initialize" do
    it "works with no parameters" do
      config = Google::Cloud::Config.new

      config.must_be_kind_of Google::Cloud::Config
      _(config.subconfigs!).must_equal []
    end

    it "accepts empty fields array" do
      config = Google::Cloud::Config.new []

      config.must_be_kind_of Google::Cloud::Config
      _(config.subconfigs!).must_equal []
    end

    it "initializes options to nil" do
      _(legacy_config.opt1).must_be_nil
      _(legacy_config.opt2).must_be_nil
    end

    it "initializes nested Google::Cloud::Config" do
      assert Google::Cloud::Config === legacy_config.k1
      assert Google::Cloud::Config === legacy_config.k2
      assert Google::Cloud::Config === legacy_config.k2.k3
    end

    it "accepts hash too" do
      config = Google::Cloud::Config.new({k1: {k2: [:k3]}})

      assert Google::Cloud::Config === config.k1
      assert Google::Cloud::Config === config.k1.k2
      assert Google::Cloud::Config === config.k1.k2.k3
    end
  end

  describe "#add_options" do
    it "introduces new nested categories" do
      _(legacy_config.k4).must_be_nil

      legacy_config.add_options [:k4, {k5: [:k6]}]

      assert Google::Cloud::Config === legacy_config.k4
      assert Google::Cloud::Config === legacy_config.k5
      assert Google::Cloud::Config === legacy_config.k5.k6
    end

    it "accepts simple hash with one symbol" do
      _(legacy_config.k4).must_be_nil

      legacy_config.add_options k4: :k5

      assert Google::Cloud::Config === legacy_config.k4
      assert Google::Cloud::Config === legacy_config.k4.k5
    end
  end

  describe "#add_field!" do
    it "adds a simple field with no validator" do
      new_config.add_field! :opt1
      _(new_config.fields!).must_equal [:opt1]
      _(new_config.field?(:opt1)).must_equal true
      _(-> () {
        obj = Object.new
        _(new_config.opt1).must_be_nil
        new_config.opt1 = obj
        _(new_config.opt1).must_be_same_as obj
      }).must_be_silent
    end

    it "adds a simple field with an integer default value" do
      new_config.add_field! :opt1, 1
      _(new_config.fields!).must_equal [:opt1]
      _(new_config.field?(:opt1)).must_equal true
      _(-> () {
        _(new_config.opt1).must_equal 1
        new_config.opt1 = 2
        _(new_config.opt1).must_equal 2
      }).must_be_silent
      _(-> () {
        new_config.opt1 = "hi"
      }).must_output nil, %r{Invalid value}
    end
  end

  describe "#add_alias!" do
    it "creates an alias" do
      checked_config.add_alias! :opt1_int_alias, :opt1_int
      _(checked_config.alias?(:opt1_int_alias)).must_equal :opt1_int
      _(checked_config.alias?(:opt1_int)).must_be_nil
      _(checked_config.aliases!).must_equal [:opt1_int_alias]
    end

    it "causes the alias to act as an alias" do
      checked_config.add_alias! :opt1_int_alias, :opt1_int
      checked_config.opt1_int_alias = 4
      _(checked_config.opt1_int).must_equal 4
      checked_config.opt1_int = 6
      _(checked_config.opt1_int_alias).must_equal 6
    end
  end

  describe "#add_config!" do
    it "adds an empty subconfig" do
      new_config.add_config! :sub1
      _(new_config.subconfigs!).must_equal [:sub1]
      _(new_config.subconfig?(:sub1)).must_equal true
      assert Google::Cloud::Config === new_config.sub1
      _(new_config.sub1.subconfigs!).must_equal []
    end
  end

  describe ".create" do
    it "creates nested subconfigs" do
      _(checked_config.fields!).must_equal [:opt1_int]
      _(checked_config.subconfigs!).must_equal [:sub1]
      _(checked_config.sub1.fields!).must_equal [:opt2_sym]
      _(checked_config.sub1.subconfigs!).must_equal [:sub2]
      _(checked_config.sub1.sub2.fields!).must_include :opt3_bool
      _(checked_config.sub1.sub2.subconfigs!).must_equal []
    end
  end

  describe "#option?" do
    it "returns true if configuration has that option" do
      _(legacy_config.option?(:opt1)).must_equal false
      legacy_config.opt1 = true
      _(legacy_config.option?(:opt1)).must_equal true
    end

    it "returns true even if the key is a sub configuration group" do
      assert Google::Cloud::Config === legacy_config.k2
      _(legacy_config.option?(:k2)).must_equal true
    end

    it "returns false if configuration doesn't have that option" do
      _(legacy_config.option?(:k7)).must_equal false
    end
  end

  describe "#reset!" do
    it "resets a single key" do
      checked_config.opt1_int = 2
      _(checked_config.opt1_int).must_equal 2
      checked_config.sub1.sub2.opt3_bool = false
      _(checked_config.sub1.sub2.opt3_bool).must_equal false

      checked_config.reset! :opt1_int

      _(checked_config.opt1_int).must_equal 1
      _(checked_config.sub1.sub2.opt3_bool).must_equal false
    end

    it "recursively resets" do
      checked_config.opt1_int = 2
      _(checked_config.opt1_int).must_equal 2
      checked_config.sub1.sub2.opt3_bool = false
      _(checked_config.sub1.sub2.opt3_bool).must_equal false

      checked_config.reset!

      _(checked_config.opt1_int).must_equal 1
      _(checked_config.sub1.sub2.opt3_bool).must_equal true
    end
  end

  describe "#delete!" do
    it "deletes a single field" do
      _(checked_config.field?(:opt1_int)).must_equal true
      _(checked_config.subconfigs!).wont_equal []

      checked_config.delete! :opt1_int

      _(checked_config.field?(:opt1_int)).must_equal false
      _(checked_config.subconfigs!).wont_equal []
    end

    it "deletes everything" do
      checked_config.add_alias! :opt1_int_alias, :opt1_int
      _(checked_config.fields!).wont_equal []
      _(checked_config.subconfigs!).wont_equal []
      _(checked_config.aliases!).wont_equal []

      checked_config.delete!

      _(checked_config.fields!).must_equal []
      _(checked_config.subconfigs!).must_equal []
      _(checked_config.aliases!).must_equal []
    end
  end

  describe "#method_missing" do
    it "allows any key for a legacy config" do
      _(legacy_config.total_non_sense).must_be_nil
    end

    it "sets and gets an option for a legacy config" do
      _(legacy_config.opt1).must_be_nil
      legacy_config.opt1 = "test value"
      _(legacy_config.opt1).must_equal "test value"
    end

    it "sets a nested option for a legacy config" do
      _(legacy_config.k2.opt4).must_be_nil
      legacy_config.k2.opt4 = "test value"
      _(legacy_config.k2.opt4).must_equal "test value"
    end

    it "allows any key but warns for a checked config" do
      _(-> () {
        _(new_config.total_non_sense).must_be_nil
      }).must_output nil, %r{Key :total_non_sense does not exist}
    end

    it "allows any key but warns for a checked config" do
      _(-> () {
        _(new_config.total_non_sense).must_be_nil
      }).must_output nil, %r{Key :total_non_sense does not exist}
    end

    it "checks type of an integer field and allows but warns on invalid" do
      _(-> () {
        checked_config.opt1_int = 20
        _(checked_config.opt1_int).must_equal 20
      }).must_be_silent

      _(-> () {
        checked_config.opt1_int = Google::Cloud::Config.deferred { rand(10) }
        _(checked_config.opt1_int).must_be :>=, 0
        _(checked_config.opt1_int).must_be :<, 10
        _(checked_config.opt1_int).must_be_kind_of Integer
      }).must_be_silent

      _(-> () {
        checked_config.opt1_int = "20"
      }).must_output nil, %r{Invalid value}
      _(checked_config.opt1_int).must_equal "20"

      _(-> () {
        checked_config.opt1_int = nil
      }).must_output nil, %r{Invalid value}
      _(checked_config.opt1_int).must_be_nil
    end

    it "checks type of a symbol field and allows but warns on invalid" do
      _(-> () {
        checked_config.sub1.opt2_sym = :bye
        _(checked_config.sub1.opt2_sym).must_equal :bye
      }).must_be_silent

      _(-> () {
        checked_config.sub1.opt2_sym = Google::Cloud::Config.deferred { "foo".to_sym }
        _(checked_config.sub1.opt2_sym).must_equal :foo
      }).must_be_silent

      _(-> () {
        checked_config.sub1.opt2_sym = "bye"
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.opt2_sym).must_equal "bye"

      _(-> () {
        checked_config.sub1.opt2_sym = nil
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.opt2_sym).must_be_nil
    end

    it "checks type of a boolean field and allows but warns on invalid" do
      _(-> () {
        checked_config.sub1.sub2.opt3_bool = false
        _(checked_config.sub1.sub2.opt3_bool).must_equal false
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_bool = Google::Cloud::Config.deferred { true }
        _(checked_config.sub1.sub2.opt3_bool).must_equal true
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_bool = nil
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.sub2.opt3_bool).must_be_nil
    end

    it "checks type of a boolean field that allows nil" do
      _(-> () {
        checked_config.sub1.sub2.opt3_bool_nil = false
        _(checked_config.sub1.sub2.opt3_bool_nil).must_equal false
        checked_config.sub1.sub2.opt3_bool_nil = nil
        _(checked_config.sub1.sub2.opt3_bool_nil).must_be_nil
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_bool_nil = "true"
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.sub2.opt3_bool_nil).must_equal "true"
    end

    it "checks type of an enum field" do
      _(-> () {
        checked_config.sub1.sub2.opt3_enum = :two
        _(checked_config.sub1.sub2.opt3_enum).must_equal :two
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_enum = Google::Cloud::Config.deferred { :one }
        _(checked_config.sub1.sub2.opt3_enum).must_equal :one
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_enum = :four
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.sub2.opt3_enum).must_equal :four
    end

    it "checks type of an regex match field" do
      _(-> () {
        checked_config.sub1.sub2.opt3_regex = "bye"
        _(checked_config.sub1.sub2.opt3_regex).must_equal "bye"
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_regex = Google::Cloud::Config.deferred { String :foo }
        _(checked_config.sub1.sub2.opt3_regex).must_equal "foo"
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_regex = "BYE"
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.sub2.opt3_regex).must_equal "BYE"
    end

    it "checks type of a multiclass match field" do
      _(-> () {
        checked_config.sub1.sub2.opt3_class = :hi
        _(checked_config.sub1.sub2.opt3_class).must_equal :hi
      }).must_be_silent

      _(-> () {
        checked_config.sub1.sub2.opt3_class = 1
      }).must_output nil, %r{Invalid value}
      _(checked_config.sub1.sub2.opt3_class).must_equal 1
    end

    it "allows any type on a default field" do
      _(-> () {
        obj = Object.new
        checked_config.sub1.sub2.opt3_default = obj
        _(checked_config.sub1.sub2.opt3_default).must_be_same_as obj
      }).must_be_silent
    end
  end

  describe "#to_s!" do
    it "builds without warnings" do
      _(-> () {
        _(checked_config.to_s!).must_equal "<Config: opt1_int=1 sub1=<Config: opt2_sym=:hi sub2=<Config: opt3_bool=true opt3_bool_nil=true opt3_enum=:one opt3_regex=\"hi\" opt3_class=\"hi\" opt3_default=nil>>>"
      }).must_be_silent
    end

    it "is aliased as inspect" do
      _(-> () {
        _(checked_config.inspect).must_equal "<Config: opt1_int=1 sub1=<Config: opt2_sym=:hi sub2=<Config: opt3_bool=true opt3_bool_nil=true opt3_enum=:one opt3_regex=\"hi\" opt3_class=\"hi\" opt3_default=nil>>>"
      }).must_be_silent
    end
  end

  describe "#respond_to?" do
    it "is an alias of field" do
      _(checked_config.field?(:opt1_int)).must_equal true
      _(checked_config.respond_to?(:opt1_int)).must_equal true
      _(checked_config.respond_to?(:opt1_int)).must_equal checked_config.field?(:opt1_int)

      checked_config.delete! :opt1_int

      _(checked_config.field?(:opt1_int)).must_equal false
      _(checked_config.respond_to?(:opt1_int)).must_equal false
      _(checked_config.respond_to?(:opt1_int)).must_equal checked_config.field?(:opt1_int)
    end
  end

  describe "shared config" do
    after {
      Google::Cloud.configure.reset!
    }

    it "loads default credentials from a file path environment variable" do
      path = File.join __dir__, "config_test.rb"
      env = {"GOOGLE_CLOUD_CREDENTIALS" => path,
             "GOOGLE_CLOUD_CREDENTIALS_JSON" => '{"a": 1}'}
      ENV.stub(:[], ->(k) { env[k] }) do
        _(Google::Cloud.configure.credentials).must_equal path
      end
    end

    it "loads default credentials from a json environment variable" do
      path = File.join __dir__, "$nonexistent-file$"
      env = {"GOOGLE_CLOUD_CREDENTIALS" => path,
             "GOOGLE_CLOUD_CREDENTIALS_JSON" => '{"a": 1}'}
      ENV.stub(:[], ->(k) { env[k] }) do
        _(Google::Cloud.configure.credentials).must_equal({"a" => 1})
      end
    end
  end
end
