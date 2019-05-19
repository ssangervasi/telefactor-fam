# frozen_string_literal: true

require 'fam/cli'

RSpec.shared_context 'cli' do
  let(:cli) { Hanami::CLI.new(Fam::CLI) }
end
