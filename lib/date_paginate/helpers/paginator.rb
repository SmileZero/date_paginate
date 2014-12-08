require 'active_support/inflector'
require 'action_view'
require 'action_view/context'
require 'date_paginate/helpers/tags'

module DatePaginate
  module Helpers
    class Paginator
      include ::ActionView::Context

      def initialize(template, options)
        options[:num_pages] ||= DatePaginate.config.default_num_pages
        @template, @options = template, options

        @date_paginate_type = @options[:date_paginate_type] if @options[:date_paginate_type].in? date_paginate_type_list
        @date_paginate_type ||= DatePaginate.config.default_paginate_type

        @param_name = @options.delete(:param_name)
        @params = @options[:params] ? template.params.merge(@options.delete :params) : template.params
      end

      def date_paginate_type_list
        [:months, :weeks]
      end

      def partial_path
        [
         "date_paginate",
         "paginate_#{@date_paginate_type}",
        ].compact.join("/")
      end

      # delegates view helper methods to @template
      def method_missing(name, *args, &block)
        @template.respond_to?(name) ? @template.send(name, *args, &block) : super
      end
      private :method_missing

      def to_s(locals = {})
        @template.render :partial => partial_path, :locals => @options.merge(locals), :formats => [:html]
      end
    end
  end
end
