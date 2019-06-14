# frozen_string_literal: true

require 'tmpdir'
require 'pathname'

RSpec.shared_context 'tempdir' do
  let(:tempdir_prefix) { 'tempdir' }

  let!(:original_dir) do
    Pathname.pwd
  end

  let!(:tempdir) do
    Dir.mktmpdir(tempdir_prefix)
  end

  let!(:tempdir_pathname) do
    Pathname.new(tempdir)
  end

  before(:each) do
    Dir.chdir(tempdir)
  end

  after(:each) do
    Dir.chdir(original_dir)
    FileUtils.remove_dir(tempdir, true)
  end
end
