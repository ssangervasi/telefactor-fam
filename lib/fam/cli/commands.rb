# frozen_string_literal: true

require 'hanami/cli'

module Fam::CLI
  module MutatingCommand
    def self.extended(other_mod)
      other_mod.option(
        :family_path,
        desc: 'The family tree file to modify.',
        default: './family.json'
      )
    end
  end

  module Add
    class Person < Hanami::CLI::Command
      extend MutatingCommand

      argument :name, required: true, desc: "The person's full name. Must be unique"

      def call(**args)
        puts <<~MESSAGE
          Adding person:
          #{args.inspect}
        MESSAGE
      end
    end

    class Parent < Hanami::CLI::Command
      extend MutatingCommand

      def call(**args)
        puts <<~MESSAGE
          Adding parent:
          #{args.inspect}
        MESSAGE
      end
    end
  end

  class Version < Hanami::CLI::Command
    def call(*)
      puts "fam #{Fam::VERSION}"
    end
  end
end
