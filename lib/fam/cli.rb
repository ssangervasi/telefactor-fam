# frozen_string_literal: true

# CLI tool: https://github.com/hanami/cli
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

      class Interactive < Hanami::CLI::Command
        def call(*)
          Fam::Interactive.new.start
        end
      end

      register 'version', Version, aliases: ['v', '-v', '--version']
      register 'interactive', Interactive, aliases: ['i']

      # Default to interactive if no command is provided.
      register '', Interactive
    end
  end
end
