# frozen_string_literal: true

require 'open3'

require 'fam/cli'

ExecResult = Struct.new(:output, :error, :status)

def exec_fam(fam_args)
  exec_args = %w[fam] + fam_args
  # Crazily, this is the best way to exec.
  ExecResult.new(*Open3.capture3(*exec_args))
end