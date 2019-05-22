# frozen_string_literal: true

require 'spec_helper'
require 'spec_helpers/cli'

RSpec.describe Fam::CLI::Add::Parent do
  subject(:add_parent) do
    exec_fam('add', 'person', person_name)
  end

  let(:parent_names) { %w[Homer Marge] }
  let(:child_name) { 'Bart Simpson' }

  it 'reports the parents were added' do
    expect(add_parent.output)
      .to include(person_name)
      .and include(*parent_names)
  end
end
