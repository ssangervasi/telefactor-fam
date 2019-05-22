# frozen_string_literal: true

require 'open3'

require 'fam/cli'

ExecReport = Struct.new(:output, :error, :status)

def exec_fam(*fam_args)
  # Crazily, this is the best way to exec.
  stdout_str, stderr_str, process_status = Open3.capture3('fam', *fam_args)
  ExecReport.new(
    stdout_str,
    stderr_str,
    process_status.exitstatus,
  )
end
