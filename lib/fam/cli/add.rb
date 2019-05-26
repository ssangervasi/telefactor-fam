# frozen_string_literal: true

require 'hanami/cli'

require 'fam/cli/arg_defs'
require 'fam/cli/result'

module Fam::CLI
  class Command < Hanami::CLI::Command
    include ResultHelpers
  end

  module Add
    class Person < Command
      ArgDefs
        .new(self)
        .input_path
        .output_path

      argument(
        :person_name,
        required: true,
        desc: "The person's full name. Must be unique.",
      )

      def call(
        input_path:,
        output_path:,
        person_name:,
        **
      )
        Fam.add_person(
          input_path: input_path,
          output_path: output_path,
          person_name: person_name,
        ).finish
      end
    end

    class Parent < Command
      ArgDefs
        .new(self)
        .input_path
        .output_path

      argument(
        :child_name,
        required: true,
        desc: "The child's full name. Must already exist.",
      )
      argument(
        :parent_names,
        type: :array,
        required: true,
        desc: 'The names of one or two parents who already exist.',
      )

      def call(
        input_path:,
        output_path:,
        child_name:,
        parent_names:,
        **
      ) 
        Fam.add_parents(
          input_path: input_path,
          output_path: output_path,
          child_name: child_name,
          parent_names: parent_names,
        ).finish
      end

      def 
    end
  end
end
