# frozen_string_literal: true

require 'exceptions/unpageable_resource_error'

module Pagination
  # The order of this hash matters, elements are pulled off the end by calling .pop recursively
  DEFAULT_PAGINATION = [[:page, ->(params) { params.dig(:page, :number) }],
                        [:per, ->(params) { params.dig(:page, :size) }]].freeze

  def paginate(pageable_resource, methods = DEFAULT_PAGINATION.dup, params = self.params)
    return pageable_resource if methods.blank?
    key_value_array = methods.pop
    build_pagination(key_value_array, paginate(pageable_resource, methods, params), params)
  end

  private

    def build_pagination(key_value_array, pageable_resource, params)
      unless pageable_resource.respond_to?(key_value_array[0])
        raise UnpageableResourceError, "Resource does not respond to '#{key_value_array[0]}' method!"
      end

      pageable_resource.public_send(key_value_array[0], key_value_array[1].call(params))
    end
end
