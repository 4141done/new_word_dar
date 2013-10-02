class CreateDailyCounts < ActiveRecord::Migration
  def change
    create_table :daily_counts do |t|
      t.integer :count
      t.datetime :day
      t.references :word
      t.timestamps
    end
  end
end
