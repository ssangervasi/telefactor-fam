# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam do
  include_context 'tempdir'

  let(:input_pathname) { tempdir_pathname.join('family-in.json') }
  let(:output_pathname) { tempdir_pathname.join('family-out.json') }

  describe '#add_person' do
    let(:person_name) { Hatchery::Names.jose }

    it 'writes the output file' do
      Fam.add_person(
        input_path: input_pathname.to_s,
        output_path: output_pathname.to_s,
        person_name: person_name
      )

      expect(output_pathname.read).to include(person_name)
    end
  end
end
