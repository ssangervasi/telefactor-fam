# frozen_string_literal: true

class Fam::Family
  Person = Struct.new(
    :name,
    keyword_init: true
  )
end
