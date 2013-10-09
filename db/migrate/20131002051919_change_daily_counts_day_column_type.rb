class ChangeDailyCountsDayColumnType < ActiveRecord::Migration
  def change
    change_column :daily_counts, :day, :date
  end
end
