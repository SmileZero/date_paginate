module DatePaginate
  module ApplicationHelper
    def set_date(with_day: true)
      params["day"] = 1 unless with_day

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

    def set_month
      set_date(with_day: false)
    end


    def recent_months(month_number=1)
      now = Time.current.to_date
      months = []
      month_number.times {|i| months << now.beginning_of_month.months_ago(i) }
      months
    end

    def recent_weeks(week_number=1)
      now = Time.current.to_date
      weeks = []
      week_number.times {|i| weeks << now.beginning_of_week.weeks_ago(i) }
      weeks
    end
  end
end
