# frozen_string_literal: true

require 'fam/version'
require 'fam/interactive'
require 'fam/views'
require 'fam/family'

module Fam
  class << self
    def interactive
      Fam::Interactive.new.start
    end
  end
end
