class ApplicationController < ActionController::Base
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
end
