# frozen_string_literal: true

require 'hanami/cli'

require 'fam'
require 'fam/cli/add'
require 'fam/cli/get'

module Fam
  module CLI
    extend Hanami::CLI::Registry

    def self.call
      Hanami::CLI.new(self).call
    end

    class Version < Hanami::CLI::Command
      def call(*)
        puts "fam #{Fam::VERSION}"
      end
    end

    register 'add', aliases: ['a'] do |prefix|
      prefix.register 'person', Add::Person
      prefix.register 'parents', Add::Parent, aliases: %w[parent]
    end
    register 'version', Version, aliases: %w[v -v --version]
  end
end
