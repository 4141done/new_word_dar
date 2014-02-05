class CreatesUnprocessedContent < ActiveRecord::Migration
  def change
    create_table :unprocessed_content do |t|
      t.text :source
      t.text :source_id
      t.text :content
      t.timestamps
    end
  end
end
