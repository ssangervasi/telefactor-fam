# frozen_string_literal: true

require 'open3'

require 'spec_helper'
require 'fam/cli'

def exec_fam(*fam_args)
  # Crazily, this is the best way to exec.
  stdout_str, stderr_str, process_status = Open3.capture3('fam', *fam_args)
  Fam::CLI::Result.new(
    stdout_str,
    stderr_str,
    process_status.exitstatus
  )
end

RSpec.shared_context 'CLI' do
  shared_examples 'a successful command' do
    it 'exits with a zero status code' do
      expect(subject.status).to eq(0), (subject.output + subject.error)
    end
  end

  shared_examples 'a failed command' do
    it 'exits with a non-zero status code' do
      expect(subject.status).to (be > 0), (subject.output + subject.error)
    end
  end
end

RSpec.configure do |rspec|
  rspec.include_context 'CLI', :cli
end
