# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam do
  include_context 'tempdir'

  let(:input_pathname) { tempdir_pathname.join('family-in.json') }
  let(:output_pathname) { tempdir_pathname.join('family-out.json') }

  let(:input_contents) { {} }
  let!(:write_input_contents) do
    input_pathname.write(JSON.pretty_generate(input_contents))
  end

  let(:output_contents) do
    JSON.parse(output_pathname.read, symbolize_names: true)
  end

  describe '#add_person' do
    subject(:add_person) do
      Fam.add_person(
        input_path: input_pathname.to_s,
        output_path: output_pathname.to_s,
        person_name: person_name
      )
    end

    let(:person_name) { Hatchery::Names.jose }

    it { is_expected.to be_success }

    it 'writes the person name to the output file' do
      add_person

      expect(output_contents).to match a_hash_including(
        people: include(
          a_hash_including(
            name: person_name
          )
        )
      )
    end
  end

  describe '#add_parents' do
    subject(:add_parents) do
      Fam.add_parents(
        input_path: input_pathname.to_s,
        output_path: output_pathname.to_s,
        child_name: child_name,
        parent_names: parent_names
      )
    end

    let(:input_contents) do
      {
        people: [
          { name: child_name },
          { name: parent_names[0] },
          { name: parent_names[1] },
        ],
      }
    end

    let(:child_name) { Hatchery::Names.bart }
    let(:parent_names) { Hatchery::Names.simpson_parents }

    it { is_expected.to be_success }

    it 'writes the new relationship to the output file' do
      add_parents

      expect(output_contents).to match a_hash_including(
        relationships: include(
          a_hash_including(
            child_name: child_name,
            parent_name: parent_names[0]
          ),
          a_hash_including(
            child_name: child_name,
            parent_name: parent_names[1]
          )
        )
      )
    end
  end

  describe '#get_parents' do
    subject(:get_parents) do
      Fam.get_parents(
        input_path: input_pathname.to_s,
        child_name: child_name
      )
    end

    let(:input_contents) do
      {
        people: [
          { name: child_name },
          { name: parent_names[0] },
          { name: parent_names[1] },
        ],
        relationships: [
          {
            child_name: child_name,
            parent_name: parent_names[0],
          },
          {
            child_name: child_name,
            parent_name: parent_names[1],
          },
        ],
      }
    end

    let(:child_name) { Hatchery::Names.bart }
    let(:parent_names) { Hatchery::Names.simpson_parents }

    it { is_expected.to be_success }

    it 'returns each parent name on a line' do
      lines = get_parents.output.lines.map(&:chomp)
      expect(lines).to match_array(parent_names)
    end
  end

  describe '#get_grandparents' do
    subject(:get_grandparents) do
      Fam.get_grandparents(
        input_path: input_pathname.to_s,
        child_name: example_child.name,
        greatness: greatness
      )
    end

    let(:input_contents) { hatcher.great_big_family.to_h }
    let(:example_child) { hatcher.root_child }
    let(:hatcher) { Hatchery::GreatBigFamilyHatcher.new(gen_count: 4) }

    describe 'with greatness 0' do
      let(:greatness) { 0 }

      it { is_expected.to be_success }

      it 'returns each grandparent name on a line' do
        lines = get_grandparents.output.lines.map(&:chomp)
        expect(lines).to match_array(hatcher.generations[2].map(&:name))
      end
    end

    describe 'with greatness 1' do
      let(:greatness) { 1 }

      it { is_expected.to be_success }

      it 'returns each great-grandparent name on a line' do
        lines = get_grandparents.output.lines.map(&:chomp)
        expect(lines).to match_array(hatcher.generations[3].map(&:name))
      end
    end
  end
end
