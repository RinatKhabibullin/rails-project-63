# frozen_string_literal: true

class BaseElement
  def self.build(**attributes, &)
    new(**attributes, &).build
  end

  def initialize(_attributes)
    NotImplementedError
  end

  def build
    NotImplementedError
  end

  private

  def element_attributes
    NotImplementedError
  end

  def tag_name
    NotImplementedError
  end
end
