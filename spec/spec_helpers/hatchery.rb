# frozen_string_literal: true

# Basically a bunch of fixtures. Use it, change it, whatever you want.
module Hatchery
  module Names
    class << self
      def simpsons
        [bart, homer, marge]
      end

      def bart
        'Bart Simpson'
      end

      def homer
        'Homer Simpson'
      end

      def marge
        'Marge Simpson'
      end

      def jose
        'José Exemplo'
      end
    end
  end

  module People
    class << self
      def simpsons
        [bart, homer, marge]
      end

      def bart
        Fam::Family::Person.new(name: Hatchery::Names.bart)
      end

      def homer
        Fam::Family::Person.new(name: Hatchery::Names.homer)
      end

      def marge
        Fam::Family::Person.new(name: Hatchery::Names.marge)
      end

      def jose
        Fam::Family::Person.new(name: Hatchery::Names.jose)
      end
    end
  end
end
