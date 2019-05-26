# frozen_string_literal: true

module Fam::CLI
  Result = Struct.new(:output, :error, :status) do
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
