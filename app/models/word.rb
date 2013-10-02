class Word < ActiveRecord::Base
  has_many :daily_counts
end