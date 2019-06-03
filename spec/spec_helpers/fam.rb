# frozen_string_literal: true

require 'fam'
require 'spec_helpers/names'


module Hatchery
  class << self
    def many_people(names:)
      names.map do |name|
        Fam::Person.new(name: name)
      end
    end
  end
end
