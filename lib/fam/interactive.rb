# frozen_string_literal: true

module Fam
  class Interactive
    def initialize(prompt:)
      @prompt = prompt
    end

    attr_reader :prompt

    def start
      state = WelcomeState.new(prompt: prompt)
      state = state.call until state.terminal?
    end

    class State
      def terminal?
        false
      end
    end

    class PromptingState < State
      def initialize(prompt:)
        @prompt = prompt
      end

      attr_reader :prompt
    end

    class WelcomeState < PromptingState
      def call
        puts 'Fam -- Build your family tree.'

        res = prompt.ask('What would you like to to do?')
        case res
        when 'help'
          return HelpState.new(after: WelcomeState.new(prompt: prompt))
        when 'birth'
          puts 'wow'
        end
        TerminalState.new
      end
    end

    class HelpState < State
      def initialize(after:)
        @after = after
      end

      def call
        puts <<~HELP
          Available commands:
            - help
            - birth
            - death
        HELP
        @after
      end
    end

    class TerminalState < State
      def call
        raise 'TerminalState'
      end

      def terminal?
        true
      end
    end
  end
end
