# frozen_string_literal: true

require 'spec_helpers/cli'

RSpec.describe Fam::CLI::Add::Person, :cli do
  subject(:add_person) do
    exec_fam('add', 'person', person_name)
  end

  context 'when a name is given' do
    let(:person_name) { 'Señor Sample' }

    it 'reports the person was added' do
      expect(add_person.output).to match(/#{person_name}/i)
    end

    it 'exits with success' do
      expect(add_person.status).to eq 0
    end
  end

  context 'when no name is provided' do
    subject(:add_person) do
      exec_fam('add', 'person')
    end

    it 'reports the error' do
      expect(add_person.output).to include('ERROR')
    end

    it 'exits with failure' do
      expect(add_person.status).to be > 0
    end
  end
end
