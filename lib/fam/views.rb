# frozen_string_literal: true

module Fam::Views
  class Home
    def initialize(prompt:, family:)
      @prompt = prompt
      @family = family
    end

    def call
      @prompt.puts 'What would you like to do?'
      @prompt.puts '(enter "help" to see a list of commands)'

      answer = @prompt.ask('>') do |question|
        question.validate(&command_map.keys.method(:include?))
        question.messages[:valid?] =  "Must be one of: #{command_map.keys.join(', ')}"
      end

      command_map.fetch(answer, command_map['help'])
    end

    private

    def command_map
      @command_map ||= {
        'help' => Help.new(
          prompt: @prompt,
          next_view: dup,
          commands: %w[help birth exit]
        ),
        'birth' => Birth.new(
          prompt: @prompt,
          family: @family
        ),
        'exit' => nil
      }
    end
  end

  class Help
    def initialize(prompt:, next_view:, commands:)
      @prompt = prompt
      @next_view = next_view
      @commands = commands
    end

    def call
      command_lines = @commands.map do |command|
        "  - #{command}"
      end

      @prompt.puts <<~HELP
        Available commands:
        #{command_lines.join("\n")}
      HELP

      @next_view
    end
  end

  class Birth
    def initialize(prompt:, family:)
      @prompt = prompt
      @family = family
    end

    def call
      @prompt.puts 'Birth a new person'
      person_name = @prompt.ask('Name:') do |question|
        question.validate(/[\w\s-]+/)
      end

      @prompt.puts "#{person_name} was born"

      Home.new(prompt: @prompt)
    end
  end
end