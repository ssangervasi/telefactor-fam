# frozen_string_literal: true

require 'fam/version'
require 'fam/family'

module Fam
  class << self
    def add_person(
      input_path:,
      output_path:,
      person_name:
    )
      return <<~MESSAGE
        Added person: #{person_name}
      MESSAGE
    end

    def add_parents(
      input_path:,
      output_path:,
      child_name:,
      parent_names:
    )

      return <<~MESSAGE
        Added #{parent_names.join(' & ')}
        as parents of #{child_name}
      MESSAGE
    end
  end
end
