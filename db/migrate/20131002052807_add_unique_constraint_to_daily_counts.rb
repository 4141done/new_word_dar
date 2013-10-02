class AddUniqueConstraintToDailyCounts < ActiveRecord::Migration
  def change
    add_index :daily_counts, [:word_id, :day], :unique
  end
end
