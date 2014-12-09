module DatePaginate
  class Hooks
    def self.init
      ActiveSupport.on_load(:active_record) do
        require 'date_paginate/models/active_record_extension'
        ::ActiveRecord::Base.send :include, DatePaginate::ActiveRecordExtension
      end

      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, DatePaginate::ActionViewExtension
      end
    end
  end
end
