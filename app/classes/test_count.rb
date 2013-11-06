class TestCount
  attr_accessor :word_counter
  def self.hello
    skip_words = SkipWord.all.select(:word).map(&:word)
    wc = WordCounter.new skip_words
    content = File.open("lib/dumpin.txt").read
    wc.process content
  end
end