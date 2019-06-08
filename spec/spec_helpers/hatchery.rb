# frozen_string_literal: true

module Hatchery
  class << self
    def many_people(names:)
      names.map do |name|
        Fam::Person.new(name: name)
      end
    end
  end

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
end
