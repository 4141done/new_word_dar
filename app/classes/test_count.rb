class TestCount
  attr_accessor :word_counter
  def self.hello
    wc = WordCounter.new SkipWord.all_words
    content = File.open("lib/test_dumps/worldnews11-12-2013.txt").read
    wc.process content
  end

  def self.reddit
    to_import = [
      'worldnews.txt',
      'AskReddit.txt',
      'WTF.txt',
      'AdviceAnimals.txt',
      'OkCupid.txt'
    ]
    wc = WordCounter.new SkipWord.all_words

    to_import.each do |f|
      content = File.open("lib/test_dumps/#{f}").read
      wc.process content

      f.truncate(0)
    end
  end
end