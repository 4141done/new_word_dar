class CreateSkipWord < ActiveRecord::Migration
  def change
    create_table :skip_words do |t|
      t.string :word, null: false
      t.string :source, null: false
      t.index :word, unique: true
    end
  end
end
