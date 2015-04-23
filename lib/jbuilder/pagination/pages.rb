class Jbuilder
  def pages!(collection, options={})
    return unless collection

    pages do
      pages_from(collection).map do |k, v|
        _set_value k, "#{options[:url]}?page=#{v}&per_page=#{collection.per_page}"
      end
    end
  end

  private

  def pages_from(collection)
    return {} if collection.total_pages == 1

    {}.tap do |pages|
      unless collection.current_page == 1
        pages[:first] = 1
        pages[:prev]  = collection.current_page - 1
      end

      unless collection.current_page == collection.total_pages
        pages[:last] = collection.total_pages
        pages[:next] = collection.current_page + 1
      end
    end
  end
end
