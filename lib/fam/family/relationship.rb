# frozen_string_literal: true

class Fam::Family
  class Relationship
    module Sides
      LEFT = 'left'
      RIGHT = 'right'

      def self.[](raw_side)
        side = raw_side&.to_s&.downcase
        return LEFT if [LEFT, 'mother', 'mom'].include?(side)
        return RIGHT if [RIGHT, 'father', 'dad'].include?(side)
        raise "Invalid side: #{raw_side}"
      end
    end

    def self.from_h(input_hash)
      new(
        child_name: input_hash.fetch(:child_name),
        parent_name: input_hash.fetch(:parent_name),
        side: Sides[input_hash[:side]]
      )
    end

    def initialize(
      child_name:,
      parent_name:,
      side:
    )
      @child_name = child_name
      @parent_name = parent_name
      @side = side
    end

    attr_reader :child_name,
                :parent_name,
                :side
  end
end
