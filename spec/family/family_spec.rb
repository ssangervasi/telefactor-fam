# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::Family do
  subject(:family) { described_class.new }

  describe '#add_person' do
    let(:example_person) { Family::Person.new(name: Names.jose) }

    context 'when the name is new' do
      subject(:add_person) { family.add_person(example_person) }

      it 'adds a person' do
        add_person
        expect(family).to have_person(example_person)
      end
    end

    context 'when the name has already been added' do
      it 'raises a duplicate person error' do
        family.add_person(example_person)

        expect { add_person }
          .to raise_error(Fam::Errors::DuplicatePerson)
      end
    end

    context 'when adding many people' do
      subject(:add_many) do
        example_people.each do |person|
          family.add_person(person)
        end
      end
      let(:example_people) { Hatchery.many_people(names: Names.simpsons) }

      it 'includes them all' do
        add_many
        aggregate_failures do
          example_people.each do |person|
            expect(family).to have_person(person)
          end
        end
      end
    end
  end

  describe '#add_parents' do
    it 'works' do
      Names.simpsons.each { |name| family.add_person(name: name) }

      family.add_parents(
        child_name: Names.bart,
        parent_names: [
          Names.homer,
          Names.marge,
        ]
      )
    end
  end
end
