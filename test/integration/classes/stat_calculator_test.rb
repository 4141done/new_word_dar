require 'test_helper'

describe StatCalculator do
  before do
    word = Word.create(word: 'straf')
    count = DailyCount.create(count: 4, day: Time.now.midnight+6.hours, word: word)
    DailyCount.create(count: 3, day: Time.now.midnight+6.hours-1.day, word: word)
    DailyCount.create(count: 2, day: Time.now.midnight+6.hours-2.days, word: word)
    DailyCount.create(count: 1, day: Time.now.midnight+6.hours-3.days, word: word)

    DailyCount.create(count: 6, day: Time.now.midnight+6.hours-8.days, word: word)
    DailyCount.create(count: 11, day: Time.now.midnight+6.hours-10.days, word: word)

    @calc = word.stats
  end

  it "should show today's word counts" do
    @calc.today.must_equal 4
  end

  it "should show yesterday's word counts" do
    @calc.yesterday.must_equal 3
  end

  it "should show this week's total word count" do
    @calc.this_week.must_equal 10
  end

  it "should show last week's daily word count" do
    @calc.last_week.must_equal 17
  end

  it "should show last 30 days total word count" do
    @calc.last_30_days.must_equal 27
  end
end