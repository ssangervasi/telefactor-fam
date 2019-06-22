# frozen_string_literal: true

require 'fam/family/person'
require 'fam/family/relationship'

module Fam
  # IMPLEMENT ME
  # Other than the class name, everything in here gets cleared when before
  # the code is handed off to the sourcerer.
  class Family
    module Errors
      class Any < StandardError; end
      class DuplicatePerson < Any; end
      class NoSuchPerson < Any; end
    end

    def self.from_h(input_hash)
      people =
        input_hash
        .fetch(:people, [])
        .map(&Person.method(:from_h))
      relationships =
        input_hash
        .fetch(:relationships, [])
        .map(&Relationship.method(:from_h))
      new(
        people: people,
        relationships: relationships
      )
    end

    def initialize(people: [], relationships: [])
      initialize_name_to_person(people)
      @relationships = relationships
    end

    def to_h
      {
        people: @name_to_person.values.map(&:to_h),
        relationships: @relationships.map(&:to_h),
      }
    end

    def inspect
      "#<#{self.class.name} with #{@people.length} members>"
    end

    def add_person(person)
      raise Errors::DuplicatePerson if include?(person.name)

      @name_to_person[person.name] = person
    end

    def get_person(name)
      raise NoSuchPerson unless include?(name: name)

      @name_to_person.fetch(name)
    end

    def include?(name)
      @name_to_person.include?(name)
    end

    private

    def initialize_name_to_person(people)
      @name_to_person = people.to_h do |person|
        [person.name, person]
      end
    end
  end
end
