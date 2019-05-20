# frozen_string_literal: true

require 'hanami/cli'

require 'fam/cli/arg_defs'

module Fam::CLI
  module Add
    class Person < Hanami::CLI::Command
      ArgDefs
        .new(self)
        .input_path
        .output_path

      argument :name, required: true, desc: "The person's full name. Must be unique."

      def call(**args)
        puts <<~MESSAGE
          Adding person:
          #{args.inspect}
        MESSAGE
      end
    end

    class Parent < Hanami::CLI::Command
      ArgDefs
        .new(self)
        .input_path
        .output_path

      def call(**args)
        puts <<~MESSAGE
          Adding parent:
          #{args.inspect}
        MESSAGE
      end
    end
  end
end
