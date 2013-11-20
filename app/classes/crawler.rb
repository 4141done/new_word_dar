  # Encoding: utf-8

class Crawler
  def self.crawl_all
    CrawlQueue.all.each do |i|
      i.crawler.constantize.crawl_item(i) 
      puts "* Crawled: #{i.crawl_params}"
    end
  end
end