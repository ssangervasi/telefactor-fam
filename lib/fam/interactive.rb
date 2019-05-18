# frozen_string_literal: true

# Prompting tool: https://github.com/piotrmurach/tty-prompt
require 'tty/prompt'

module Fam
  class Interactive
    def initialize
      @prompt = TTY::Prompt.new
    end

    def start
      @prompt.puts 'Fam -- Build your family tree.'

      view = Views::Home.new(
        prompt: @prompt,
        family: Fam::Family.new
      )
      while view do
        view = view.call
      end

      goodbye
    rescue TTY::Reader::InputInterrupt
      goodbye
    end

    private

    def goodbye
      @prompt.puts 'Later, fam!'
    end
  end
end
