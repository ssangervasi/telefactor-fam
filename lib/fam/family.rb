# frozen_string_literal: true

require 'fam/family/person'
require 'fam/family/nuclear'
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

    def to_h
      {
        people: @people.map(&:to_h),
        relationships: relationships.map(&:to_h),
      }
    end

    def initialize(people: [], relationships: [])
      @people = people
      @relationships = relationships
    end

    def inspect
      "#<#{self.class.name} with #{@people.length} members>"
    end

    def add_person(person)
      raise Errors::DuplicatePerson if include?(person)

      name_to_person[person.name] = person
    end

    def include?(name)
      name_to_person.include?(name)
    end

    def get_person(name:)
      raise NoSuchPerson unless include?(name: name)

      name_to_person.fetch(name)
    end

    def add_parents(child_name:, parent_names:)
      child = get_person(name: child_name)
      parents = parent_names.map do |name|
        get_person(name: name)
      end
    end

    def get_parents(person)
      []
    end

    private

    def name_to_person
      @name_to_person ||= @people.to_h do |person|
        [person.name, person]
      end
    end

    # def get_relation

    def relationships
      @relationships ||= Set.new
    end
  end
end
