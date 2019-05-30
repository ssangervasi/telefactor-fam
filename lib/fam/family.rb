# frozen_string_literal: true

module Fam
  module Errors
    class Any < StandardError; end
    class DuplicatePerson < Any; end
  end

  # IMPLEMENT ME
  # Other than the class name, everything in here gets cleared when before
  # the code is handed off to the sourcerer.
  class Family
    def add_person(name:)
      raise Errors::DuplicatePerson if people.include?(name)

      people << name
    end

    def people
      @people ||= []
    end
  end
end
