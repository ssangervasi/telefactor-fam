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

      register 'version', Version, aliases: ['v', '-v', '--version']
    end
  end
end
