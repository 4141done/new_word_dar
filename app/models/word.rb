class Word < ActiveRecord::Base
  has_many :daily_counts, dependent: :destroy

  def refresh_statistics
    calculator = StatCalculator.new(self)

    self.last_week = calculator.last_week
    self.this_week = calculator.this_week
    self.today = calculator.today
    self.yesterday = calculator.yesterday
    self.two_days_ago = calculator.two_days_ago
    self.last_30_days = calculator.last_30_days
    self.diff_last_two_days = calculator.diff_last_two_days
    self.diff_last_two_weeks = calculator.diff_last_two_weeks

    self.save
  end

end