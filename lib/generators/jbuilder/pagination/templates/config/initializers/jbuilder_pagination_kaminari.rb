# Configuration for kaminari

Jbuilder::Pagination.configure do |c|
  # c.total_pages_method = :total_pages
  # c.current_page_method = :current_page
  c.per_page_method = :limit_value # Default: :per_page
  # c.per_page_param = :per_page
  # c.page_method = :page
  # c.page_param = :page
end
