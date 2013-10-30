class TestCount
  attr_accessor :word_counter
  def self.hello
    d = File.open('lib/2of12inf.txt').each_line.map { |word| word.strip.downcase }
    d = d + File.open('lib/unix_words.txt').each_line.map { |word| word.strip.downcase }
    wc = WordCounter.new d
    content = File.open("lib/dumpin.txt").read
    wc.process content
  end
end