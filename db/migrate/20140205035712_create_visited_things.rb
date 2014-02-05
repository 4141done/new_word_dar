class CreateVisitedThings < ActiveRecord::Migration
  def change
    create_table :visited_things do |t|
      t.text :source
      t.text :thing_id
      t.timestamps
    end
  end
end