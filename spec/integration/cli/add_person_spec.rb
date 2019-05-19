# frozen_string_literal: true

require 'spec_helper'
require 'spec_helpers/cli'

RSpec.describe 'fam add person' do
  include_context 'cli'

  it 'works' do
    out = StringIO.new
    cli.call(arguments: %w[fam add person], out: out)
    expect(out.string).to include('fam')
  end
end