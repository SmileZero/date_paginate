require "date_paginate/engine"

module DatePaginate
end

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

$stderr.puts <<-EOC if !defined?(Rails)

Your Gemfile might not be configured properly.
---- e.g. ----
Rails:
    gem 'date_paginate'
EOC

# load DatePaginate components
require 'date_paginate/config'
require 'date_paginate/helpers/action_view_extension'
require 'date_paginate/helpers/paginator'
require 'date_paginate/models/within_period_module'
require 'date_paginate/hooks'

# if not using Railtie, call `DatePaginate::Hooks.init` directly
if defined? Rails
  require 'date_paginate/railtie'
  require 'date_paginate/engine'
end
