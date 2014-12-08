require 'date_paginate/models/within_period_module'

module DatePaginate
  module ActiveRecordModelExtension
    extend ActiveSupport::Concern

    included do
      self.send(:include, DatePaginate::WithinPeriodModule)
    end
  end
end
