# frozen_string_literal: true

require 'pathname'
require 'json'

module Fam::File
  module Reader
    module Errors
      class Any < StandardError; end
      class FileMissing < Any; end
      class InvalidFormat < Any; end
    end

    def self.create(path:)
      return NullReader.new if path.nil? || path.empty?

      JSONReader.new(path: path)
    end

    class NullReader
      def read
        Fam::Family.new
      end
    end

    class JSONReader
      def initialize(path:)
        @path = path
      end

      def read
        raise Errors::FileMissing, pathname unless pathname.exist?

        read_json
        raise Errors::InvalidFormat, @format_error if invalid_format?

        Fam::Family.new(
          people: people,
          relationships: relationships
        )
      end

      private

      def invalid_format?
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

      def read_json
        @json_hash ||= JSON.parse(pathname.read)
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
