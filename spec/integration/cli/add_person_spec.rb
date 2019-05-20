# frozen_string_literal: true

require 'spec_helper'
require 'spec_helpers/cli'

RSpec.describe 'fam add person' do
  it 'works' do
    result = exec_fam(%w[add person])
    expect(result.output).to include('fam')
  end
end