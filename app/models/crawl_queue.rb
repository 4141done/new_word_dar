class CrawlQueue < ActiveRecord::Base
  def self.crawled_files
    files = Dir["#{CRAWL_DUMPS_DIRECTORY}/*"]
  end
end