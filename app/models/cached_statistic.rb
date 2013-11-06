class CachedStatistic < ActiveRecord::Base
  LAST_WEEK = :last_week
  THIS_WEEK = :this_week
  TODAY = :today
  YESTERDAY = :yesterday
  TWO_DAYS_AGO = :two_days_ago
  LAST_30_DAYS = :last_30_days
end
