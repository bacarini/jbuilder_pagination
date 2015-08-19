class Jbuilder

  def pages!(collection, options={})
    return unless collection

    custom_page_param = options.fetch(:page_param, page_param)
    custom_per_page_param = options.fetch(:per_page_param, per_page_param)

    pages do
      pages_from(collection).map do |k, v|
        url = "#{options[:url]}?#{custom_page_param}=#{v}&#{custom_per_page_param}=#{collection.send(per_page_method)}"

        _set_value k, url
      end
    end
  end

  private

  delegate :current_page_method, :total_pages_method, :per_page_method, :page_param, :per_page_param, to: :configuration

  def configuration
    Pagination.configuration
  end


  def pages_from(collection)
    total_pages = collection.send(total_pages_method)
    current_page = collection.send(configuration.current_page_method)

    return {} if total_pages == 1

    {}.tap do |pages|
      unless current_page == 1
        pages[:first] = 1
        pages[:prev]  = current_page - 1
      end

      unless current_page == total_pages
        pages[:last] = total_pages
        pages[:next] = current_page + 1
      end
    end
  end

end
