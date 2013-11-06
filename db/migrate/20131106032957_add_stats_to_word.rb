class AddStatsToWord < ActiveRecord::Migration
  def change
    add_column :words, :last_week, :integer
    add_column :words, :this_week, :integer
    add_column :words, :today, :integer
    add_column :words, :yesterday, :integer
    add_column :words, :two_days_ago, :integer
    add_column :words, :last_30_days, :integer
    add_column :words, :diff_last_two_days, :integer
    add_column :words, :diff_last_two_weeks, :integer
  end
end
