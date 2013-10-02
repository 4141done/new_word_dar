class AddIndexToDailyCounts < ActiveRecord::Migration
  def change
    add_index :daily_counts, :word_id
    add_index :daily_counts, :day
  end
end
