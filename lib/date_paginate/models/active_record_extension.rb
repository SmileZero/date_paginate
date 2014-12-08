require 'date_paginate/models/active_record_model_extension'

module DatePaginate
  module ActiveRecordExtension
    extend ActiveSupport::Concern
    included do
      # Future subclasses will pick up the model extension
      class << self
        def inherited_with_date_paginate(kls) #:nodoc:
          inherited_without_date_paginate kls
          kls.send(:include, DatePaginate::ActiveRecordModelExtension) if kls.superclass == ::ActiveRecord::Base
        end
        alias_method_chain :inherited, :date_paginate
      end

      # Existing subclasses pick up the model extension as well
      self.descendants.each do |kls|
        kls.send(:include, DatePaginate::ActiveRecordModelExtension) if kls.superclass == ::ActiveRecord::Base
      end
    end
  end
end
