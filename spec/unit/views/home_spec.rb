# frozen_string_literal: true

require 'spec_helper'

# I don't know if I need this
RSpec.describe Fam::Views::Home do
  subject(:home) do
    described_class.new(prompt: prompt, family: family)
  end

  let(:prompt) { spy(instance_double(TTY::Prompt)) }
  let(:family) { spy(instance_double('Fam::Family')) }

  it { is_expected.to be_an_instance_of(described_class) }

  describe '#call' do
    before do
      allow(prompt)
        .to receive(:ask)
        .and_return(answer)
    end

    let(:answer) { '' }

    it 'prints a question' do
      home.call

      expect(prompt)
        .to have_received(:puts)
        .with('What would you like to do?')
        .ordered
      expect(prompt)
        .to have_received(:puts)
        .with('(enter "help" to see a list of commands)')
        .ordered
    end

    describe 'the view returned' do
      subject(:view_returned) { home.call }

      context 'when the answer is "help"' do
        let(:answer) { 'help' }

        it { is_expected.to be_an_instance_of(Fam::Views::Help) }
      end

      context 'when the answer is "birth"' do
        let(:answer) { 'birth' }

        it { is_expected.to be_an_instance_of(Fam::Views::Birth) }
      end

      context 'when the answer is "exit"' do
        let(:answer) { 'exit' }

        it { is_expected.to be_nil}
      end
    end
  end
end
