module DatePaginate
  class Engine < ::Rails::Engine
    initializer "date_paginate.assets.precompile" do |app|
      app.config.assets.precompile += %w(default.css)
    end
  end
end
