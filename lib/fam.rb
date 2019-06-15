# frozen_string_literal: true

require 'fam/version'
require 'fam/cli/result'
require 'fam/family'
require 'fam/file'

module Fam
  # Includes the .success and .failure helpers which return Fam::CLI::Result objects
  #   that the CLI knows how to handle. All of the module methods should return
  #   either `success(message)` or `failure(message)`, but how they do that
  #   is up to the sourcerer.
  extend Fam::CLI::Result::Helpers
  # Includes the .read and .write helpers which will support read and writing
  #   JSON with symbol keys. These methods don't check the structure of the file,
  #   only that it is valid JSON.
  # All of the module methods should use `read(path: input_path)` to get the input family
  #   tree data, if any. Reading from a non-existant file produces an empty hash.
  # All of the "add" methods should use `write(path: output_path, json_hash: {...})`
  #   to save their output. This creates the file, or overwrites if it already exists.
  extend Fam::File::Helpers

  class << self
    # IMPLEMENT ME
    def add_person(
      input_path:,
      output_path:,
      person_name:
    )
      json_hash = read(path: input_path)

      json_hash[:people] ||= []
      json_hash[:people] << person_name

      write(path: output_path, json_hash: json_hash)
      success("Added person: #{person_name}")
    end

    # IMPLEMENT ME
    def add_parents(
      input_path:,
      output_path:,
      child_name:,
      parent_names:
    )
      json_hash = read(path: input_path)
      write(path: output_path, json_hash: json_hash)
      success("Added #{parent_names.join(' & ')} as parents of #{child_name}")
    end

    # IMPLEMENT ME
    def get_person(
      input_path:,
      person_name:
    )
      json_hash = read(path: input_path)
      people = json_hash.fetch(:people, [])
      return success(person_name) if people.include?(person_name)

      failure("No such person '#{person_name}' in family '#{input_path}'")
    end

    # IMPLEMENT ME
    def get_parents(
      input_path:,
      child_name:,
      side:
    )
      json_hash = read(path: input_path)
      success(
        <<~MESSAGE
          input_path: #{input_path.inspect}
          child_name: #{child_name.inspect}
          side:       #{side.inspect}

          json_hash:
          #{json_hash.inspect}
        MESSAGE
      )
    end

    # IMPLEMENT ME
    def get_grandparents(
      input_path:,
      child_name:,
      greatness:
    )
      json_hash = read(path: input_path)
      success(
        <<~MESSAGE
          input_path: #{input_path.inspect}
          child_name: #{child_name.inspect}
          greatness: #{greatness.inspect}

          json_hash:
          #{json_hash.inspect}
        MESSAGE
      )
    end
  end
end
