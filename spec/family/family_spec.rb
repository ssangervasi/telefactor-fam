# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::Family do
  subject(:family) { described_class.new }

  describe '#add_person' do
    let(:example_name) { 'Josè Exemplo' }

    context 'when the name is new' do
      subject(:add_person) { family.add_person(name: example_name) }

      it 'adds a person' do
        add_person
        expect(family).to have_person(name: example_name)
      end

      it 'returns the person' do
        expect(add_person).to be_an_object_having_attributes(
          name: example_name
        )
      end
    end

    context 'when the name has already been added' do
      it 'raises a duplicate person error' do
        family.add_person(name: example_name)

        expect { family.add_person(name: example_name) }
          .to raise_error(Fam::Errors::DuplicatePerson)
      end
    end

    context 'when adding many people' do
      subject(:add_many) do
        people_names.each do |name|
          family.add_person(name: name)
        end
      end

      let(:people_names) { ['Jimby Nimby', 'Dib', 'Slammy'] }

      it 'includes them all' do
        add_many
        aggregate_failures do
          people_names.each do |name|
            expect(family).to have_person(name: name)
          end
        end
      end
    end
  end

  describe '#add_parents' do

    it 'works' do
      Names.simpsons.each { |name| family.add_person(name: name) }

      bart = family.add_parents(
        child_name: Names.bart,
        parent_names: [
          Names.homer,
          Names.marge,
        ]
      )

      expect(bart.parents).to include(
        an_object_with_attributes(name: Names.homer),
        an_object_with_attributes(name: Names.marge),
      )
    end
  end
end
