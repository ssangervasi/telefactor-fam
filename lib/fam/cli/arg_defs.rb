# frozen_string_literal: true

module Fam::CLI
  class ArgDefs
    include Fam::CLI::ResultHelpers

    def initialize(command)
      @command = command
    end

    def input_path
      tap do
        @command.option(
          :input_path,
          desc: 'The family tree file read from.',
          default: './family.json',
        )
      end
    end

    def output_path
      tap do
        @command.option(
          :output_path,
          desc: 'The family tree file to save changes to.'
        )
      end
    end
  end
end
