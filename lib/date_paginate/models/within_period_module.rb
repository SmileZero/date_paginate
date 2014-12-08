module DatePaginate
  module WithinPeriodModule
    extend ActiveSupport::Concern

    included do
      def self.within_week(column=:created_at, date)
        where(column => date.in_time_zone.all_week)
      end

      def self.within_month(column=:created_at, date)
        where(column => date.in_time_zone.all_month)
      end
    end
  end
end
