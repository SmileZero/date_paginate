require 'rails_helper'

describe DiariesController do
  describe "set_month" do
    it do
      get "index", year: Time.current.months_ago(1).year, month: Time.current.months_ago(1).month
      expect(assigns(:date)).to eq(Time.current.months_ago(1).beginning_of_month.to_date)
      expect(response).to be_success
    end
  end

  describe "set_week" do
    it do
      get "week_partition", year: Time.current.year, month: Time.current.month, day: Time.current.day
      expect(assigns(:date)).to eq(Time.current.to_date)
      expect(response).to be_success
    end
  end

  describe "set_date" do
    it do
      get "day_partition", year: Time.current.year, month: Time.current.month, day: Time.current.day
      expect(assigns(:date)).to eq(Time.current.to_date)
      expect(response).to be_success
    end
  end
end
