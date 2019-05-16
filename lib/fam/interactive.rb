# frozen_string_literal: true

# Prompting tool: https://github.com/piotrmurach/tty-prompt
require 'tty/prompt'

module Fam
  class Interactive
    def initialize(prompt:)
      @prompt = prompt
    end

    attr_reader :prompt

    def start
      prompt = TTY::Prompt.new
      puts 'Fam -- Build your family tree.'
      puts 'What would you like to to do?'

      puts "#{sup}? Nice."
      prompt.suggest(sup, ['eat me', 'dank'])
    end
  end
end
