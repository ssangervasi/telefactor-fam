# frozen_string_literal: true

class Fam::Family
  Relationship = Struct.new(
    :child_name,
    :parent_name,
    :side,
    keyword_init: true
  )
end
