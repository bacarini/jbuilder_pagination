class Jbuilder
  ONE_PAGE = 1

  def pages!(collection, options={})
    return unless collection && is_paginated?(collection)

    pages_from(collection).map do |key, value|
      params = query_parameters(options).merge(page: { number: value, size: collection.size }).to_query
      _set_value key, "#{options.fetch(:url, nil)}?#{params}"
    end
  end

  private

  def pages_from(collection)
    {}.tap do |pages|
      pages[:self] = collection.current_page
      return pages if collection.total_pages <= ONE_PAGE

      unless collection.current_page == ONE_PAGE
        pages[:first] = ONE_PAGE
        pages[:prev]  = collection.current_page - ONE_PAGE
      end

      unless collection.current_page == collection.total_pages
        pages[:next] = collection.current_page + ONE_PAGE
        pages[:last] = collection.total_pages
      end
    end
  end

  def query_parameters(options)
    @query_parameters ||= (options.fetch(:query_parameters, {}) || {}).compact
  end

  def is_paginated?(collection)
    collection.respond_to?(:current_page) &&
      collection.respond_to?(:total_pages) &&
      collection.respond_to?(:size)
  end
end
