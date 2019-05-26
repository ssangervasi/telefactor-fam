# frozen_string_literal: true

module Fam::CLI
  Result = Struct.new(:output, :error, :status) do
    def combine(&block)
      other_result = block.call
      return self if other_result.nil?

      self.class.new(
        [output, other_result.output].reject(&:empty?).join("\n"),
        [error, other_result.error].reject(&:empty?).join("\n"),
        status + other_result.status
      )
    end

    def on_success(&block)
      return self if status > 0

      combine(&block)
    end

    def finish
      output.empty? || STDOUT.puts(output)
      error.empty? || warn(error)
      exit(status)
    end
  end

  module ResultHelpers
    def success(message = '')
      Fam::CLI::Result.new(message, '', 0)
    end

    def failure(message = '')
      Fam::CLI::Result.new('', message, 1)
    end
  end

end
