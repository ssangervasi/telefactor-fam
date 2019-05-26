# frozen_string_literal: true

require 'fam/version'
require 'fam/family'
require 'fam/cli/result'

module Fam
  class << self
    def Success(message = '')
      Fam::CLI::Result.new(message, '', 0)
    end

    def Failure(message = '')
      Fam::CLI::Result.new('', message, 1)
    end

    def add_person(
      input_path:,
      output_path:,
      person_name:
    )
      Success("Added person: #{person_name}")
    end

    def add_parents(
      input_path:,
      output_path:,
      child_name:,
      parent_names:
    )
      Success("Added #{parent_names.join(' & ')} as parents of #{child_name}")
    end
  end
end
