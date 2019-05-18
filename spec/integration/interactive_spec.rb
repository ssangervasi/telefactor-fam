# frozen_string_literal: true

require 'spec_helper'
require 'tty/test_prompt'

# This is an end-to-end test.
RSpec.describe Fam::Interactive do
  subject(:interactive) do
    described_class.new
  end

  let!(:prompt) do
    TTY::TestPrompt.new.tap do |test_prompt|
      expect(TTY::Prompt).to receive(:new)
        .and_return(test_prompt)
    end
  end

  def script(*messages)
    messages.each do |message|
      prompt.input << "#{message}\r"
    end 
    prompt.input.rewind
  end

  describe 'asking for help' do
    it 'works' do
      script(
        'help',
        'exit'
      )
      
      interactive.start

      expect(prompt.output.string)
        .to include("Available commands:\n")
        .and include("Later, fam!")
    end
  end
end
