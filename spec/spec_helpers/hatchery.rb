# frozen_string_literal: true

# Basically a bunch of fixtures. Use it, change it, whatever you want.
module Hatchery
  module Names
    class << self
      def simpsons
        [bart, homer, marge]
      end

      def simpson_parents
        [homer, marge]
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

      def simpson_parents
        [homer, marge]
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

  module Relationships
    class << self
      def simpson_parents
        [bart_homer, bart_marge]
      end

      def bart_homer
        Fam::Family::Relationship.new(
          child_name: Hatchery::Names.bart,
          parent_name: Hatchery::Names.homer
        )
      end

      def bart_marge
        Fam::Family::Relationship.new(
          child_name: Hatchery::Names.bart,
          parent_name: Hatchery::Names.marge
        )
      end
    end
  end
end
