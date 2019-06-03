# frozen_string_literal: true

require 'fam'

module Names
  class << self
    def bart
      'Bart Simpson'
    end

    def homer
      'Homer Simpson'
    end

    def marge
      'Marge Simpson'
    end

    def simpsons
      [bart, homer, marge]
    end
  end
end
