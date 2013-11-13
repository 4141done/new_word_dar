class TestCount
  attr_accessor :word_counter
  def self.hello
    skip_words = SkipWord.all.select(:word).map(&:word)
    wc = WordCounter.new skip_words
    content = File.open("lib/test_dumps/worldnews11-12-2013.txt").read
    wc.process content
  end

  def self.reddit
    to_import = ['worldnews11-12-2013.txt', 'AskReddit11-12-2013.txt', 'WTF11-12-2013.txt', 'AdviceAnimals11-12-2013.txt']
    skip_words = SkipWord.all.select(:word).map(&:word)
    wc = WordCounter.new skip_words

    to_import.each do |f|
      content = File.open("lib/test_dumps/#{f}").read
      wc.process content
    end
  end
end