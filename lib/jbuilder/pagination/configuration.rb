module Jbuilder::Pagination
  class Configuration

    attr_accessor :current_page_method, :total_pages_method, :per_page_method, :page_method, :page_param, :per_page_param

    def initialize
      @total_pages_method = :total_pages
      @current_page_method = :current_page
      @per_page_method = :per_page
      @per_page_param = :per_page
      @page_method = :page
      @page_param = :page
    end
  end
end
