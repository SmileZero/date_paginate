module DatePaginate
  module WithinPeriodModule
    extend ActiveSupport::Concern

    included do
      def self.within_day(date, column=:created_at)
        where(column => date.in_time_zone.all_day)
      end

      def self.within_week(date, column=:created_at)
        where(column => date.in_time_zone.all_week)
      end

      def self.within_month(date, column=:created_at)
        where(column => date.in_time_zone.all_month)
      end
    end
  end
end
