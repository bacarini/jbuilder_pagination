# frozen_string_literal: true

class UnpageableResourceError < StandardError
  def initialize(message)
    super(message)
  end
end
