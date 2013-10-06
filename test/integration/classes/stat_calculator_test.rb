require 'test_helper'

describe StatCalculator do
  before do
    word = Word.create(word: 'straf')
    count = DailyCount.create(count: 4, day: Time.now, word: word)
    DailyCount.create(count: 3, day: Time.now-1.day)
    DailyCount.create(count: 2, day: Time.now-2.days)
    DailyCount.create(count: 1, day: Time.now-3.days)

    DailyCount.create(count: 6, day: Time.now-8.days)
    DailyCount.create(count: 11, day: Time.now-10.days)

    @calc = word.stats
  end

  it "should show today's word counts" do
    @calc.today.must_equal 4
  end

  #it "should show yesterday's word counts" do
  #  @calc.yesterday.must_equal 3
  #end

  it "should show this week's total word count" do
    @calc.this_week.must_equal 10
  end

  #it "should show last week's daily word count" do
  #  @calc.last_week.must_equal 17
  #end
  #
  #it "should show last 30 days total word count" do
  #  @calc.last_30_days.must_equal 27
  #end
end