require 'active_support/inflector'
require 'action_view'
require 'action_view/context'

module DatePaginate
  module Helpers
    class Paginator
      include ::ActionView::Context

      PARAM_KEY_BLACKLIST = :authenticity_token, :commit, :utf8, :_method

      def self.paginate_type_list
        [:days, :weeks, :months]
      end

      def initialize(template, options)
        options[:num_pages] ||= DatePaginate.config.default_num_pages

        unless options[:date_paginate_type].in? self.class.paginate_type_list
          options[:date_paginate_type] = DatePaginate.config.default_paginate_type
        end

        @template, @options = template, options

        @date_paginate_type = @options.delete(:date_paginate_type)
        @num_pages = @options.delete(:num_pages)
        @options["recent_#{@date_paginate_type}".to_sym] = send("recent_#{@date_paginate_type}")
        @params = template.params.except(*PARAM_KEY_BLACKLIST).merge(@options.delete(:params) || {})
      end

      paginate_type_list.each do |date_paginate_type|
        eval <<-RUBY
          def recent_#{date_paginate_type}
            now = Time.current.to_date
            #{date_paginate_type} = []
            @num_pages.to_i.times do |i|
              begin_time = now.beginning_of_#{date_paginate_type.to_s.singularize}
              #{date_paginate_type} << begin_time.#{date_paginate_type}_ago(i)
            end
            #{date_paginate_type}
          end
        RUBY
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
        locals = locals.merge(params: @params)
        @template.render :partial => partial_path, :locals => @options.merge(locals), :formats => [:html]
      end
    end
  end
end
