class CreateCrawlQueue < ActiveRecord::Migration
  def change
    create_table :crawl_queues do |t|
      t.json :crawl_params
      t.string :crawler
      t.datetime :last_crawl
    end
  end
end
