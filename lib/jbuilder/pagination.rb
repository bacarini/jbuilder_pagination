require "jbuilder"
require "jbuilder/pagination/pages"
require "jbuilder/pagination/configuration"

module Jbuilder::Pagination
  class ConfigurationError < StandardError;end

  def self.configure(&block)
    block.call(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
