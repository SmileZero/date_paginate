require 'active_support/configurable'

module DatePaginate
  def self.configure(&block)
    yield @config ||= DatePaginate::Configuration.config
  end

  def self.config
    @config ||= DatePaginate::Configuration.config
  end

  class Configuration
    include ActiveSupport::Configurable
    config_accessor :default_num_pages
    config_accessor :default_paginate_type

    configure do |config|
      config.default_num_pages = 6
      config.default_paginate_type = :months
    end
  end
end
