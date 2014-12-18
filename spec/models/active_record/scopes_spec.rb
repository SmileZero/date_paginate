require 'rails_helper'

describe DatePaginate::ActiveRecordModelExtension do
  before do
    class Order < ActiveRecord::Base; end
  end

  subject { Order }
  it { should respond_to(:within_day) }
  it { should respond_to(:within_week) }
  it { should respond_to(:within_month) }

  describe Kaminari::ActiveRecordExtension do
    before do
      1.upto(100) {|i| Diary.create! title: "diary#{'%03d' % i}", context: i.to_s, created_at: Time.current - i.days}
      1.upto(100) {|i| GemDefinedModel.create! title: "title#{'%03d' % i}", context: i.to_s, :created_at: Time.current - i.days}
    end
end
