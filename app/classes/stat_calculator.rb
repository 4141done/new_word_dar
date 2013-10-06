class StatCalculator

  def initialize word
    @word = word
  end

  def last_week
    counts = @word.daily_counts.where(day: (Time.now.midnight - 2.weeks)..(Time.now.midnight - 1.week))
    sum_counts(counts)
  end

  def this_week
    counts = @word.daily_counts.where(day: (Time.now.midnight - 1.weeks)..(Time.now.midnight))
    sum_counts(counts)
  end

  def today
    counts = @word.daily_counts.where(day: (Time.now.midnight)..(Time.now))
    sum_counts(counts)
  end

  private

  def sum_counts counts
    sum = 0
    counts.each do |c|
      sum += c.count
    end
    sum
  end
end