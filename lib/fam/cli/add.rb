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
        puts Fam.add_person(
          input_path: input_path,
          output_path: output_path,
          person_name: person_name,
        )
      end
    end

    class Parent < Hanami::CLI::Command
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
        puts Fam.add_parents(
          input_path: input_path,
          output_path: output_path,
          child_name: child_name,
          parent_names: parent_names,
        )
      end
    end
  end
end
