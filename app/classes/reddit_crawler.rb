# Encoding: utf-8

class RedditCrawler < Crawler
  @client = Snoo::Client.new

  def self.crawl_item(item)
    params = item.crawl_params
    subreddit = params['subreddit']
    crawled_threads = params['crawled_thread_ids']

    f = File.new("lib/test_dumps/#{subreddit}.txt", "a")
    index = get_subreddit_index(subreddit)
    each_thread(index) do |thread|
      next if crawled_threads[thread['data']['id']]
      crawled_threads[thread['data']['id']] = Time.now
      f.write(parse_topic(thread, f))
    end
    f.close
    item.crawl_params = { subreddit: subreddit, crawled_thread_ids: crawled_threads }
    item.save!
  end

  def self.get_subreddit_index(subreddit_name)
    move_down_a_level(@client.get_listing( subreddit: subreddit_name))
  end

  def self.each_thread(subreddit_index, &block)
    subreddit_index.each do |item|
      block.call(item)
    end
  end

  def self.parse_topic(topic, file)
    my_dump = []
    topic = HashWithIndifferentAccess.new(topic)

    sleep 1
    top_level_comments = @client.get_comments(
      link_id:   topic[:data][:id],
      limit:     1000,
      depth:     30
    )
    result = []
    top_level_comments.each do |comment|
      result += parse_level(comment['data']['children'])
    end

    result
  end

  def self.parse_level(comments)
    got = []

    comments.each do |c|
      next unless c['data'].present?
      got << c['data']['body'] if c['data']['body'].present?

      if c['data'] && c['data']['replies'].present?
        got += parse_level(c['data']['replies']['data']['children'])
      end
    end

    got
  end

  def self.parse_params(subreddit_name)
    subreddit = subreddit_name[:subreddit]
  end

  def self.move_down_a_level(hash_position)
    hash_position["data"]["children"]
  end
end