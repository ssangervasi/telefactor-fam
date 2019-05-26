# frozen_string_literal: true

require 'fam/version'
require 'fam/family'
require 'fam/cli/result'

module Fam
  # Includes the .success and .failure helpers which return Fam::CLI::Result objects
  # that the CLI knows how to handle.
  extend Fam::CLI::ResultHelpers

  class << self
    def add_person(
      input_path:,
      output_path:,
      person_name:
    )
      success("Added person: #{person_name}")
    end

    def add_parents(
      input_path:,
      output_path:,
      child_name:,
      parent_names:
    )
      success("Added #{parent_names.join(' & ')} as parents of #{child_name}")
    end

    def get_parents(
      input_path:,
      child_name:,
      side:
    )
      success(
        <<~MESSAGE
          Bimble, Magister of Loonies
          Bomble the Fishmogner
        MESSAGE
      )
    end

    def get_grandparents(
      input_path:,
      child_name:,
      greatness:
    )
      success(
        <<~MESSAGE
          Larry Laugher
          Donna McDermot
          Robert Baratheon
          Karl Marx
        MESSAGE
      )
    end
  end
end
