class StatCalculator

  def initialize word
    @word = word
  end

  def last_week
    total_count_for_range (Time.now.midnight - 2.weeks)..(Time.now.midnight - 1.week-1.second)
  end

  def this_week
    total_count_for_range (Time.now.midnight - 6.days)..(Time.now.midnight+1.day-1.second)
  end

  def today
    total_count_for_range (Time.now.midnight)..(Time.now)
  end

  def yesterday
    total_count_for_range (Time.now.midnight-1.day)..(Time.now.midnight-1.second)
  end

  def two_days_ago
    total_count_for_range (Time.now.midnight-2.days)..(Time.now.midnight-1.day-1.second)
  end

  def last_30_days
    total_count_for_range (Time.now.midnight - 29.days)..(Time.now.midnight+1.day-1.second)
  end

  def diff_last_two_days
    yesterday - two_days_ago
  end

  def diff_last_two_weeks
    this_week - last_week
  end

  def total_count_for_range range
    counts = @word.daily_counts.where(day: range)
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