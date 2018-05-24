# frozen_string_literal: true

module Pagination
  module Errors
    class UnpageableResourceError < StandardError
      def initialize(message)
        super(message)
      end
    end
  end
end


