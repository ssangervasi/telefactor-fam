# frozen_string_literal: true

class Fam::Family
  Nuclear = Struct.new(
    :left,
    :right,
    :children,
    keyword_init: true
  )
end
