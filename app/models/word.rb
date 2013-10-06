class Word < ActiveRecord::Base
  has_many :daily_counts

  def stats
    if @stats.blank?
      @stats = StatCalculator.new(self)
    end
    @stats
  end
end