class StatCalculator

  def initialize word
    @word = word
  end

  def last_week
    @word.daily_counts.where(day: (Time.now.midnight - 2.weeks)..(Time.now.midnight - 1.week)).inject{|sum, c|sum+c.count}
  end

  def this_week
    counts = @word.daily_counts.where(day: (Time.now.midnight - 1.weeks)..(Time.now.midnight))
    sum = 0
    counts.each do |c|
      sum += c.count
    end
    sum
  end

  def today
    counts = @word.daily_counts.where(day: (Time.now.midnight)..(Time.now))
    sum = 0
    counts.each do |c|
      sum += c.count
    end
    sum
  end
end