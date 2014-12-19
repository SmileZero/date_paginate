require 'rails_helper'

describe DatePaginate::ActiveRecordModelExtension do
  before do
    class Order < ActiveRecord::Base; end
  end

  subject { Order }
  it { should respond_to(:within_day) }
  it { should respond_to(:within_week) }
  it { should respond_to(:within_month) }

  describe DatePaginate::ActiveRecordExtension do
    before do
      1.upto(100) {|i| Diary.create! title: "diary#{'%03d' % i}", context: i.to_s, created_at: Time.current - i.days}
      1.upto(100) {|i| GemDefinedModel.create! title: "title#{'%03d' % i}", context: i.to_s, created_at: Time.current - i.days}
    end

    [Diary, GemDefinedModel].each do |model_class|
      describe "use within_day" do
        it { expect(model_class.within_day(Time.current).size).to eq(0) }
        it { expect(model_class.within_day(Time.current.yesterday).size).to eq(1) }
      end

      describe "use within_week" do
        it { expect(model_class.within_week(Time.current.weeks_ago(1)).size).to eq(7) }

        describe "within correct range" do
          it "begin date" do
            week_begin_record = model_class.within_week(Time.current.weeks_ago(1)).order(:created_at).first
            expect(week_begin_record.created_at.to_date).to eq(Time.current.weeks_ago(1).beginning_of_week.to_date)
          end

          it "end date" do
            week_end_record = model_class.within_week(Time.current.weeks_ago(1)).order(:created_at).last
            expect(week_end_record.created_at.to_date).to eq(Time.current.weeks_ago(1).end_of_week.to_date)
          end
        end
      end

      describe "use within_month" do
        let(:last_month_time) { Time.current.months_ago(2) }

        it { expect(model_class.within_month(last_month_time).size).to eq(last_month_time.end_of_month.day) }

        describe "within correct range" do
          it "begin date" do
            month_begin_record = model_class.within_month(last_month_time).order(:created_at).first
            expect(month_begin_record.created_at.to_date).to eq(last_month_time.beginning_of_month.to_date)
          end

          it "end date" do
            month_end_record = model_class.within_month(last_month_time).order(:created_at).last
            expect(month_end_record.created_at.to_date).to eq(last_month_time.end_of_month.to_date)
          end
        end
      end

      describe "use updated_at to partition" do
        it { expect(model_class.within_day(Time.current, :updated_at).size).to eq(100) }
        it { expect(model_class.within_week(Time.current, :updated_at).size).to eq(100) }
        it { expect(model_class.within_month(Time.current, :updated_at).size).to eq(100) }
      end
    end
  end
end
