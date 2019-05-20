# frozen_string_literal: true

module Fam::CLI
  class ArgDefs
    def initialize(command) 
      @command = command
    end

    def input_path
      self.tap do
        @command.option(
          :input_path,
          desc: 'The family tree file read from.',
          default: './family.json'
        )
      end
    end

    def output_path
      self.tap do
        @command.option(
          :output_path,
          desc: 'The family tree file to save changes to.',
          default: './family.json'
        )
      end
    end
  end
end
