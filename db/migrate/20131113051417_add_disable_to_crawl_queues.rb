class AddDisableToCrawlQueues < ActiveRecord::Migration
  def change
    add_column :crawl_queues, :disabled, :boolean, default: false
  end
end
