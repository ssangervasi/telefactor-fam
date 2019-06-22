# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::Family do
  subject(:family) do
    described_class.new(
      people: initial_people,
      relationships: initial_relationships
    )
  end

  let(:initial_people) { [] }
  let(:initial_relationships) { [] }

  describe '#add_person' do
    subject(:add_person) { family.add_person(example_person) }

    let(:example_person) { Hatchery::People.jose }

    context 'when the person is new' do
      it 'adds a person' do
        add_person

        expect(family).to include(example_person.name)
      end
    end

    context 'when their name has already been added' do
      let(:initial_people) { [example_person] }

      it 'raises a duplicate person error' do
        expect { add_person }
          .to raise_error(Fam::Family::Errors::DuplicatePerson)
      end
    end

    describe 'adding many people' do
      subject(:add_many) do
        example_people.each do |person|
          family.add_person(person)
        end
      end
      let(:example_people) { Hatchery::People.simpsons }

      it 'includes them all' do
        add_many

        aggregate_failures do
          example_people.each do |person|
            expect(family).to include(person.name)
          end
        end
      end
    end
  end

  describe '#add_parent' do
    subject(:add_parent) do
      family.add_parent(
        parent: example_parent,
        child: example_child
      )
    end

    context 'when adding people that are already in the family' do
      let(:initial_people) { Hatchery::People.simpsons }
      let(:example_parent) { Hatchery::People.homer }
      let(:example_child) { Hatchery::People.bart }

      it 'adds the parent' do
        add_parent

        expect(family.get_parents(example_child)).to include(example_parent)
      end
    end

    context 'when adding people who are not in the family' do
      let(:example_parent) do
        Hatchery::People.homer
      end
      let(:example_child) do
        Hatchery::People.bart
      end

      it 'raises a no such person error' do
        expect { add_parent }
          .to raise_error(Fam::Family::Errors::NoSuchPerson)
      end
    end

    context 'when the person already has two parents' do
      let(:initial_relationships) { Hatchery::Relationships.simpson_parents }

      let(:example_parent) do
        family.add_person(Hatchery::People.jose)
      end
      let(:example_child) do
        family.add_person(Hatchery::People.bart)
      end

      it 'raises an excess parents error' do
        expect { add_parent }
          .to raise_error(Fam::Family::Errors::ExcessParents)
      end
    end
  end

  describe '#get_grandparents' do
    let(:example_child) { hatcher.root_child }
    let(:family) { hatcher.great_big_family }
    let(:hatcher) { Hatchery::GreatBigFamilyHatcher.new(gen_count: 4) }

    describe 'when called without greatness' do
      subject(:get_grandparents) { family.get_grandparents(example_child) }

      it 'just gets first level grandparents' do
        expect(get_grandparents).to eq hatcher.generations[2]
      end
    end

    describe 'when called with greatness' do
      subject(:get_grandparents) do
        family.get_grandparents(example_child, greatness: greatness)
      end

      context 'with greatness 1' do
        let(:greatness) { 1 }

        it 'skips a generation' do
          expect(get_grandparents).to eq hatcher.generations[3]
        end
      end

      context 'with greatness 2' do
        let(:greatness) { 2 }

        it 'runs out of levels and returns empty' do
          expect(get_grandparents).to eq []
        end
      end
    end
  end

  describe '.from_h' do
    subject(:family) do
      described_class.from_h(
        people: [
          {
            name: Hatchery::Names.bart,
          },
          {
            name: Hatchery::Names.homer,
          },
        ],
        relationships: [
          child_name: Hatchery::Names.bart,
          parent_name: Hatchery::Names.homer,
        ]
      )
    end

    it { is_expected.to be_a_kind_of(Fam::Family) }
    it { is_expected.to include(Hatchery::Names.bart, Hatchery::Names.homer) }
  end
end
