module DatePaginate
  module WithinPeriodModule
    extend ActiveSupport::Concern

    included do
      scope :within_week, ->(column=:created_at, date) { where(column => date.in_time_zone.all_week) }
      scope :within_month, ->(column=:created_at, date) { where(column => date.in_time_zone.all_month) }
    end
  end
end
