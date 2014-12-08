module DatePaginate
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'date_paginate' do |_app|
      DatePaginate::Hooks.init
    end
  end
end
