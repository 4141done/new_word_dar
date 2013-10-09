# Encoding: utf-8

class RedditCrawler < Crawler
  @client = Snoo::Client.new

  def self.crawl_item(crawl_info)
    f = File.new("circlejerk.txt", "w+")
    index = get_subreddit_index(crawl_info)
    each_thread(index) do |thread|
      parse_topic(thread, f)
    end
    f.close
  end

  def self.get_subreddit_index(crawl_info)
    move_down_a_level(@client.get_listing( subreddit: crawl_info))
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
      # subreddit: topic[:subreddit].downcase,
      link_id:   topic[:data][:id],
      limit:     1000,
      depth:     1
    )

    isFirst = true
    top_level_comments.each do |comment|

      isFirst = false && next if isFirst
      comment['data']['children'].each do |c|
        file.write(" #{c['data']['body']}") if c['data']['body']
      end
    end
  end

  def self.parse_params(crawl_info)
    subreddit = crawl_info[:subreddit]

  end

  def self.move_down_a_level(hash_position)
    hash_position["data"]["children"]
  end
end