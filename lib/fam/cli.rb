# frozen_string_literal: true

require 'hanami/cli'

require 'fam'
require 'fam/cli/commands'

module Fam
  module CLI
    extend Hanami::CLI::Registry

    def self.call
      Hanami::CLI.new(self).call
    end

    register 'add', Add, aliases: ['a'] do |prefix|
      prefix.register 'person', Add::Person
      prefix.register 'parent', Add::Parent
    end
    register 'version', Version, aliases: ['v', '-v', '--version']
  end
end
