# Encoding: utf-8

class Crawler
  def self.crawl_all
    CrawlQueue.all.each do |i|
      i.crawler.constantize.crawl_item(i)
    end
  end
end