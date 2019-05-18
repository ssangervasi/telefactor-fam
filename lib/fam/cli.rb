# frozen_string_literal: true

require 'hanami/cli'

require 'fam'

module Fam
  module CLI
    def self.call
      Hanami::CLI.new(Fam::CLI::Commands).call
    end

    module Commands
      extend Hanami::CLI::Registry

      class Version < Hanami::CLI::Command
        def call(*)
          puts "fam #{Fam::VERSION}"
        end
      end

      module MutatingCommand
        def self.extended(other_mod)
          other_mod.option(
            :family_path,
            desc: "The family tree file to modify.",
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

      register 'add', Add, aliases: ['a'] do |prefix|
        prefix.register 'person', Add::Person
        prefix.register 'parent', Add::Parent
      end
      register 'version', Version, aliases: ['v', '-v', '--version']
    end
  end
end
