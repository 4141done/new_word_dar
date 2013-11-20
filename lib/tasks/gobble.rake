namespace :gobble do
  desc "crawl for newest threads in all queues and process"
  task crawl_and_process: :environment do
    puts '--> Crawling New Content...'
    Crawler.crawl_all
    puts '--> Done crawling!'

    puts '--> Loading in Dictionaries!'
    wc = WordCounter.new SkipWord.all_words

    CrawlQueue.crawled_files.each do |f|
      file = File.open(f)
      content = file.read
      puts "--> Processing: #{f}"
      wc.process content
    end
  end

  task crawl: :environment do
    puts '--> Crawling New Content...'
    Crawler.crawl_all
    puts '--> Done crawling!'
  end

  task process_all: :environment do
    puts '!!! DUDER! This may cause duplicates if you didn\'t clear your words table !!!'
    puts '--> Loading in Dictionaries!'
    wc = WordCounter.new SkipWord.all_words

    CrawlQueue.crawled_files.each do |f|
      file = File.open(f)
      content = file.read
      puts "--> Processing: #{f}"
      wc.process content
    end
  end
end
