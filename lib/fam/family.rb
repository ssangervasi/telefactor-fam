# frozen_string_literal: true

module Fam
  module Errors
    class Any < StandardError; end
    class DuplicatePerson < Any; end
    class NoSuchPerson < Any; end
  end

  # IMPLEMENT ME
  # Other than the class name, everything in here gets cleared when before
  # the code is handed off to the sourcerer.
  class Family
    def inspect
      "#<#{self.class.name} with #{people.length} members>"
    end

    def add_person(person)
      raise Errors::DuplicatePerson if has_person?(person)

      name_to_person[name] = new_person
    end

    def has_person?(person)
      name_to_person.include?(person.name)
    end

    def get_person(name:)
      raise NoSuchPerson unless has_person?(name: name)

      name_to_person.fetch(name)
    end

    def add_parents(child_name:, parent_names:)
      child = get_person(name: child_name)
      parents = parent_names.map do |name|
        get_person(name: name)
      end


    end

    def get_parents(child_name:)
      []
    end

    private

    def name_to_person
      @name_to_person ||= {}
    end

    def get_relation

    def relationships
      @relationships ||= Set.new
    end
  end

  Person = Struct.new(
    :name
    keyword_init: true
  )

  Relationship = Struct.new(
    :child_name,
    :parent_name,
    :side,
    keyword_init: true
  )
end
