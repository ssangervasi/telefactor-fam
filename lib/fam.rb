# frozen_string_literal: true

require 'fam/version'
require 'fam/cli/result'
require 'fam/family'

module Fam
  # Includes the .success and .failure helpers which return Fam::CLI::Result objects
  # that the CLI knows how to handle. All of the module methods should return
  # either `success(message)` or `failure(message)`, but how they do that
  # is up to the sourcerer.
  extend Fam::CLI::ResultHelpers

  class << self
    # IMPLEMENT ME
    def add_person(
      input_path:,
      output_path:,
      person_name:
    )
      success("Added person: #{person_name}")
    end

    # IMPLEMENT ME
    def add_parents(
      input_path:,
      output_path:,
      child_name:,
      parent_names:
    )
      success("Added #{parent_names.join(' & ')} as parents of #{child_name}")
    end

    # IMPLEMENT ME
    def get_person(
      input_path:,
      person_name:
    )
      success(
        <<~MESSAGE
          Sir Julius, of the Orange
        MESSAGE
      )
    end

    # IMPLEMENT ME
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

    # IMPLEMENT ME
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
