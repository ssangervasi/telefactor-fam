# frozen_string_literal: true

require 'fam/version'
require 'fam/family'
require 'fam/cli/result'

module Fam
  # Includes .success and .failure
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
  end
end
