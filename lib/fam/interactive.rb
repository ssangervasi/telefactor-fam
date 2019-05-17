# frozen_string_literal: true

module Fam
  class Interactive
    def initialize(prompt:)
      @prompt = prompt
    end

    attr_reader :prompt

    def start
      prompt.puts 'Fam -- Build your family tree.'

      prompt.puts 'What would you like to to do?'
      prompt.puts '(enter "help" to see a list of commands)'

      loop do
        res = prompt.ask('>')
        case res
        when 'help'
          help
        when 'birth'
          birth
        else
          prompt.puts "Sorry, didn't get that."
        end
      end
    rescue TTY::Reader::InputInterrupt
      prompt.puts 'See ya.'
    end

    private

    def help
      prompt.puts <<~HELP
        Available commands:
          - help
          - birth
          - death
      HELP
    end

    def birth
      prompt.puts 'Birth a new person'
      person_name = prompt.ask('Name:')
      prompt.puts "#{person_name} was born"
    end
  end
end
