require 'test_helper'

describe StatCalculator do
  before do
    word = Word.create(word: 'straf')
    count = DailyCount.create(count: 4, day: Time.now)
    DailyCount.create(count: 3, day: Time.now-1.day)
    DailyCount.create(count: 2, day: Time.now-2.days)
    DailyCount.create(count: 1, day: Time.now-3.days)
  end

  it "should show today's word counts" do
    
  end

  it "should show yesterday's word counts" do

  end

  it "should show this week's word counts" do

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