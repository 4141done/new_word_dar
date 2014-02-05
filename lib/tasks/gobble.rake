namespace :gobble do
  desc "crawl for newest threads in all queues and process"
  task crawl_and_process: :environment do
    puts '--> Crawling New Content...'
    Crawler.crawl_all
    puts '--> Done crawling!'

    puts '--> Loading in Dictionaries!'
    wc = WordCounter.new SkipWord.all_words

    UnprocessedDump.where(seen: false).each do |dump|
      wc.process dump.content
      dump.update_attributes(seen: true)
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

    UnprocessedDump.where(seen: false).each do |dump|
      wc.process dump.content
    end
  end
end
