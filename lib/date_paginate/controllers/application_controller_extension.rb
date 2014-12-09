module DatePaginate
  module ApplicationControllerExtension
    def set_date(with_day: true)
      params[:day] = 1 unless with_day

      date = if params[:year] && params[:month] && params[:day]
        begin
          "#{params[:year]}-#{params[:month]}-#{params[:day]}".to_date
        rescue ArgumentError
          flash[:error] = "Date is invalid"
        end
      end
      date  = Date.current if date.class != Date
      date  = date.beginning_of_month unless with_day
      @date = date
    end

    alias_method :set_week, :set_date

    def set_month
      set_date(with_day: false)
    end


    def recent_days(day_number)
      now = Time.current.to_date
      days = []
      day_number.times {|i| days << now.beginning_of_day.days_ago(i) }
      days
    end

    def recent_weeks(week_number)
      now = Time.current.to_date
      weeks = []
      week_number.times {|i| weeks << now.beginning_of_week.weeks_ago(i) }
      weeks
    end

    def recent_months(month_number)
      now = Time.current.to_date
      months = []
      month_number.times {|i| months << now.beginning_of_month.months_ago(i) }
      months
    end
  end
end
