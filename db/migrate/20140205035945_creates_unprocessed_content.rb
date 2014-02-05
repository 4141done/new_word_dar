class CreatesUnprocessedContent < ActiveRecord::Migration
  def change
    create_table :unprocessed_dumps do |t|
      t.text    :source
      t.text    :source_id
      t.text    :content
      t.boolean :seen, default: false
      t.timestamps
    end
  end
end
