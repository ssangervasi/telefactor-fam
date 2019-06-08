# frozen_string_literal: true

require 'pathname'
require 'json'

module Fam::File
  module Writer
    module Errors
      class Any < StandardError; end
      class InvalidPath < Any; end
      class WriteError < Any; end
    end

    def self.create(path:, family:)
      raise InvalidPath, path.inspect if path.nil? || path.empty?

      JSONWriter.new(path: path, family: family)
    end

    class JSONWriter
      def initialize(path:, family:)
        @path = path
        @family = family
      end

      def write
        write_json
        raise InvalidFormat, @format_error if invalid_format?
      end

      private

      def invalid_format?
        parse_json

        @format_error =
          if !@parser_error.nil?
            @parser_error
          elsif !@json_hash.include?('people')
            'Missing key "people" in family file.'
          elsif !@json_hash.include?('relationships')
            'Missing key "relationships" in family file.'
          end

        !@format_error.nil?
      end

      def parse_json
        @json_hash ||= pathname.open do |file|
          JSON.parse(file)
        end
      rescue JSON::ParserError => e
        @parser_error = e.message
      end

      def pathname
        @pathname ||= Pathname.new(@path)
      end

      def people
        @json_hash['people'].map do |person|
          Fam::Person.new(name: person['name'])
        end
      end

      def relationships
        @json_hash['relationships'].map do |relationship|
          Fam::Relationship.new(
            child_name: relationship['child_name'],
            parent_name: relationship['parent_name'],
            side: relationship['side']
          )
        end
      end
    end
  end
end
