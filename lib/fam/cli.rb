# frozen_string_literal: true

require 'hanami/cli'

require 'fam'
require 'fam/cli/command'
require 'fam/cli/result'
require 'fam/cli/add'
require 'fam/cli/get'

module Fam
  # This module is going to remain between rounds.
  # You should be able to the information you need by calling `--help`
  # on each command from the shell.
  # If you change anything in here it's going to be reset, so don't do it.
  module CLI
    extend Hanami::CLI::Registry

    def self.call
      Hanami::CLI.new(self).call
    end

    class Version < Command
      include ResultHelpers

      def call(*)
        finish(
          success("fam #{Fam::VERSION}")
        )
      end
    end

    register 'add', aliases: ['a'] do |prefix|
      prefix.register 'person', Add::Person
      prefix.register 'parents', Add::Parents, aliases: %w[parent p]
    end
    register 'get', aliases: ['g'] do |prefix|
      prefix.register 'parents', Get::Parents, aliases: %w[parent p grandparents]
      prefix.register 'grandparents', Get::Grandparents, aliases: %w[grandparent gp]
    end
    register 'version', Version, aliases: %w[v -v --version]
  end
end
