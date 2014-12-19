module DatePaginate
  class Railtie < ::Rails::Railtie
    initializer 'date_paginate' do |_app|
      DatePaginate::Hooks.init
    end
  end
end
