require 'test_helper'

describe StatCalculator do
  before do
    word = Word.create(word: 'straf')
    count = DailyCount.create(count: 4, day: Time.now)
    DailyCount.create(count: 3, day: Time.now-1.day)
    DailyCount.create(count: 2, day: Time.now-2.days)
    DailyCount.create(count: 1, day: Time.now-3.days)

    @calc = StatCalculator.new(word)
  end

  it "should show today's word counts" do
    @calc.today.must_equal 4
  end

  it "should show yesterday's word counts" do
    @calc.yesterday.must_equal 3
  end

  it "should show this week's word counts" do
    today = Time.now.date
    @calc.this_week[today].must_equal 4
    @calc.this_week[today-1.day].must_equal 3
    @calc.this_week[today-2.days].must_equal 2
    @calc.this_week[today-3.days].must_equal 1
    @calc.this_week[today-4.days].must_equal 0
    @calc.this_week[today-5.days].must_equal 0
    @calc.this_week[today-6.days].must_equal 0
  end

  it "should show last week's word counts" do

  end

  it "should show this month's word counts" do

  end

  it "should show last month's word counts" do

  end

  it "should show daily counts for last 30 days" do

  end

  it "should show daily counts for last 60 days" do

  end

  it "should show weekly counts for last 3 months" do

  end

  it "should show weekly counts for the last 12 months" do

  end

  it "should show monthly counts for the last 2 years" do

  end
end