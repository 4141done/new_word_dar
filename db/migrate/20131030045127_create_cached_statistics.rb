class CreateCachedStatistics < ActiveRecord::Migration
  def change
    create_table :cached_statistics do |t|
      t.string :name
      t.integer :word_id
      t.decimal :value

      t.timestamps
    end
  end
end
