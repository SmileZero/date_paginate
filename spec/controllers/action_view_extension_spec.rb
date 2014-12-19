require 'rails_helper'

describe DiariesController do
  render_views

  describe "set_month" do
    it do
      get "index", year: Time.current.months_ago(1).year, month: Time.current.months_ago(1).month
      expect(response.body.scan(/<a href=\"\/diaries\?.+">/).size).to eq(5)
    end
  end

  describe "set_week" do
    it do
      get "week_partition", year: Time.current.year, month: Time.current.month, day: Time.current.day
      expect(response.body.scan(/<a href=\"\/diaries\/week_partition\/archive\/\d+\/\d+\/\d+\">/).size).to eq(5)
    end
  end

  describe "set_date" do
    it do
      get "day_partition", year: Time.current.year, month: Time.current.month, day: Time.current.day
      expect(response.body.scan(/<a href=\"\/diaries\/day_partition\/archive\/\d+\/\d+\/\d+\">/).size).to eq(2)
    end
  end
end
