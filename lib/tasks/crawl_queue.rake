namespace :crawl_queue do
  desc "Clear out the ids that we have alread crawled for recrawling"
  task reddit_clear_crawled_threads: :environment do
    CrawlQueue.all.each do |qc|
      if qc.crawler == 'RedditCrawler'
        subreddit = qc.crawl_params['subreddit']
        puts "--> Clearing #{subreddit}"
        qc.crawl_params = { subreddit: subreddit, crawled_thread_ids: {} }
        qc.save!
      end
    end
  end
end
