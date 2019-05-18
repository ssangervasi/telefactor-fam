# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::Interactive do
  subject(:interactive) do
    described_class.new(prompt: prompt)
  end

  let(:prompt) { double('prompt') }

  it { is_expected.to_not be_nil }
end
