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

require "google/cloud/translate/v2"
require "minitest/focus"

module Google
  module Cloud
    module Translate
      module V2
        def self.stub_new
          define_singleton_method :new do |*args|
            yield *args
          end
        end
        # Create default unmocked methods that will raise if ever called
        def self.new *args
          raise "This code example is not yet mocked"
        end
        class Credentials
          # Override the default constructor
          def self.new *args
            OpenStruct.new(client: OpenStruct.new(updater_proc: Proc.new {}))
          end
        end
      end
    end
  end
end

def mock_translate
  Google::Cloud::Translate::V2.stub_new do |*args|
    key = "test-api-key"
    project = "my-todo-project"
    translate = Google::Cloud::Translate::V2::Api.new(OpenStruct.new(key: key, project_id: project))

    translate.service = Minitest::Mock.new
    yield translate.service
    translate
  end
end

YARD::Doctest.configure do |doctest|
  doctest.before "Google::Cloud::Translate::V2.new" do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: "en", translatedText: "Salve mundi!" }
      mock.expect :translate, list_translations_response([res_attrs]), [["Hello world!"], to: "la", from: nil, format: nil, model: nil, cid: nil]
    end
  end

  doctest.skip "Google::Cloud::Translate::V2::Credentials" # occasionally getting "This code example is not yet mocked"

  doctest.before "Google::Cloud::Translate::V2::Api" do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: "en", translatedText: "Salve mundi!" }
      mock.expect :translate, list_translations_response([res_attrs]), [["Hello world!"], to: "la", from: nil, format: nil, model: nil, cid: nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#project" do
    mock_translate do |mock|
      mock.expect :project_id, "my-todo-project"
    end
  end
  doctest.before "Google::Cloud::Translate::V2::Api#project_id" do
    mock_translate do |mock|
      mock.expect :project_id, "my-todo-project"
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#translate" do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: "en", translatedText: "Salve mundi!", model: "base" }
      mock.expect :translate, list_translations_response([res_attrs]), [["Hello world!"], to: "la", from: nil, format: nil, model: nil, cid: nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#translate@Using the neural machine translation model:" do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: "en", translatedText: "Salve mundi!", model: "nmt" }
      mock.expect :translate, list_translations_response([res_attrs]), [["Hello world!"], to: "la", from: nil, format: nil, model: "nmt", cid: nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#translate@Setting the `from` language." do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: nil, translatedText: "Salve mundi!" }
      mock.expect :translate, list_translations_response([res_attrs]), [["Hello world!"], to: "la", from: "en", format: nil, model: nil, cid: nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#translate@Retrieving multiple translations." do
    mock_translate do |mock|
      res_attrs_1 = { detectedSourceLanguage: nil, translatedText: "Salve amice." }
      res_attrs_2 = { detectedSourceLanguage: nil, translatedText: "Vide te mox." }
      mock.expect :translate, list_translations_response([res_attrs_1, res_attrs_2]), [["Hello my friend.", "See you soon."], to: "la", from: "en", format: nil, model: nil, cid: nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#translate@Preserving HTML tags." do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: nil, translatedText: "<strong>Salve</strong> mundi!" }
      mock.expect :translate, list_translations_response([res_attrs]), [["<strong>Hello</strong> world!"], to: "la", from: nil, format: nil, model: nil, cid: nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#detect" do
    mock_translate do |mock|
      res_attrs = { confidence: 0.7100697, language: "en", isReliable: false }
      mock.expect :detect, list_detections_response([res_attrs]), [["Hello world!"]]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#detect@Detecting multiple texts." do
    mock_translate do |mock|
      res_attrs = { confidence: 0.7100697, language: "en", isReliable: false }
      res_attrs_2 = { confidence: 0.40440267, language: "fr", isReliable: false }
      mock.expect :detect, list_detections_response([res_attrs, res_attrs_2]), [["Hello world!", "Bonjour le monde!"]]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#languages" do
    mock_translate do |mock|
      res_attrs = { language: "en", name: nil }
      mock.expect :languages, list_languages_response(res_attrs), [nil]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Api#languages@Get all languages with their names in French." do
    mock_translate do |mock|
      res_attrs = { language: "en", name: "Anglais" }
      mock.expect :languages, list_languages_response(res_attrs), ["fr"]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Detection" do
    mock_translate do |mock|
      res_attrs = { confidence: 0.7109375, language: "fr", isReliable: false }
      res_attrs_2 = { confidence: 0.59922177, language: "en", isReliable: false }
      mock.expect :detect, list_detections_response([res_attrs, res_attrs_2]), [["chien", "chat"]]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Language" do
    mock_translate do |mock|
      res_attrs = { language: "af", name: "Afrikaans" }
      mock.expect :languages, list_languages_response(res_attrs), ["en"]
    end
  end

  doctest.before "Google::Cloud::Translate::V2::Translation" do
    mock_translate do |mock|
      res_attrs = { detectedSourceLanguage: "en", translatedText: "Salve mundi!" }
      mock.expect :translate, list_translations_response([res_attrs]), [["Hello world!"], to: "la", from: nil, format: nil, model: nil, cid: nil]
    end
  end
end

# Fixture helpers

def list_translations_response attrs_arr
  JSON.parse({ translations: attrs_arr }.to_json)
end

def list_detections_response attrs_arr
  detections = attrs_arr.map { |attrs| [attrs] }
  JSON.parse({ detections: detections }.to_json)
end

def list_languages_response attrs
  languages_resources = (1..104).map { attrs }
  JSON.parse({ languages: languages_resources }.to_json)
end
