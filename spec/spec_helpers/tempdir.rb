# frozen_string_literal: true

require 'tmpdir'
require 'pathname'

RSpec.shared_context 'tempdir' do
  let(:tempdir_prefix) { 'tempdir' }

  let!(:tempdir) do
    Dir.mktmpdir(tempdir_prefix)
  end

  let!(:tempdir_pathname) do
    Pathname.new(tempdir)
  end

  after(:each) do
    FileUtils.remove_dir(tempdir, true)
  end
end
