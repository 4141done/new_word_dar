class CrawlQueue < ActiveRecord::Base
  FILE_DIRECTORY = 'lib/test_dumps'

  def self.crawled_files
    files = Dir["#{FILE_DIRECTORY}/*"]
  end
end