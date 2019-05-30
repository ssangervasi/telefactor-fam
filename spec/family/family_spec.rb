# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::Family do
  subject(:family) { described_class.new }

  describe '.new' do
    it { is_expected.to be_a_kind_of(described_class) }
  end

  describe '#add_person' do
    let(:person_name) { 'Josè Exemplo' }

    context 'when the name is new' do
      it 'adds a person' do
        family.add_person(name: person_name)

        expect(family.people).to include(person_name)
      end
    end

    context 'when the name has already been added' do
      it 'raises a duplicate person error' do
        family.add_person(name: person_name)

        expect { family.add_person(name: person_name) }
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
        expect(family.people).to include(*people_names)
      end
    end
  end
end
