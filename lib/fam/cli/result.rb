# frozen_string_literal: true

module Fam::CLI
  Result = Struct.new(:output, :error, :status) do
    def finish
      output.empty? || STDOUT.puts(output)
      error.empty? || STDERR.puts(error)
      exit(status)
    end
  end
end