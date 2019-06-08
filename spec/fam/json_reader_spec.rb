# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam::File::Reader::JSONReader do
  include_context 'tempdir'

  subject(:reader) do
    described_class.new(path: input_pathname.to_s)
  end

  let(:input_pathname) { tempdir_pathname.join('input.json') }

  describe '#read' do
    subject(:read) { reader.read }

    context 'when the file does not exist' do
      it 'raises an error' do
        expect { read }
          .to raise_error(Fam::File::Reader::Errors::FileMissing, /input\.json/)
      end
    end

    context 'when the file exists' do
      before do
        input_pathname.write(
          JSON.dump(
            people: [],
            relationships: []
          )
        )
      end

      it { is_expected.to be_kind_of(Fam::Family) }
    end
  end
end
