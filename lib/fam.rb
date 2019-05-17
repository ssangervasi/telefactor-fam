# frozen_string_literal: true

# Prompting tool: https://github.com/piotrmurach/tty-prompt
require 'tty/prompt'

require 'fam/version'
require 'fam/interactive'

module Fam
  class << self
    def interactive
      Fam::Interactive.new(
        prompt: TTY::Prompt.new
      )
    end
  end
end
