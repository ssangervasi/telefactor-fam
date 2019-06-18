# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::Family do
  subject(:family) { described_class.new }

  describe '.from_h' do
    subject(:family) do
      described_class.from_h(
        people: [
          {
            name: Hatchery::Names.bart
          },
          {
            name: Hatchery::Names.homer
          }
        ],
        relationships: [
          child_name: Hatchery::Names.bart,
          parent_name: Hatchery::Names.homer,
          side: Fam::Family::Relationship::Sides::RIGHT
        ]
      )
    end

    it { is_expected.to be_a_kind_of(Fam::Family) }
    it { is_expected.to include(Hatchery::Names.bart, Hatchery::Names.homer) }
  end


  xdescribe '#add_person' do
    let(:example_person) { Fam::Family::Person.new(name: Hatchery::Names.jose) }

    context 'when the name is new' do
      subject(:add_person) { family.add_person(example_person) }

      it 'adds a person' do
        add_person
        expect(family).to include(example_person)
      end
    end

    context 'when the name has already been added' do
      subject(:add_person) { family.add_person(example_person) }

      it 'raises a duplicate person error' do
        family.add_person(example_person)

        expect { add_person }
          .to raise_error(Fam::Family::Errors::DuplicatePerson)
      end
    end

    context 'when adding many people' do
      subject(:add_many) do
        example_people.each do |person|
          family.add_person(person)
        end
      end
      let(:example_people) { Hatchery.many_people(names: Hatchery::Names.simpsons) }

      it 'includes them all' do
        add_many
        aggregate_failures do
          example_people.each do |person|
            expect(family).to include(person)
          end
        end
      end
    end
  end

  xdescribe '#add_parents' do
    it 'works' do
      Hatchery::Names.simpsons.each { |name| family.add_person(name: name) }

      family.add_parents(
        child_name: Hatchery::Names.bart,
        parent_names: [
          Hatchery::Names.homer,
          Hatchery::Names.marge,
        ]
      )
    end
  end
end
