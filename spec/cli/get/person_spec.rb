# frozen_string_literal: true

require 'spec_helpers/cli'

RSpec.describe Fam::CLI::Get::Person, :cli do
  context 'when a child name is given' do
    subject(:get_person) do
      exec_fam('get', 'person', 'Jon Bovi')
    end

    it_behaves_like 'a successful command'
  end

  context 'when the name is missing' do
    subject(:get_person) do
      exec_fam('get', 'person')
    end

    it_behaves_like 'a failed command'
  end
end
