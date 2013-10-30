class WordCounter

  # http://wordlist.sourceforge.net/12dicts-readme.html#2of12inf
  # d = File.open('lib/2of12inf.txt').lines.map { |word| word.strip.downcase }
  def initialize blacklist=[]
    @blacklist = Set.new blacklist
  end

  # TODO: context?, try to save the sentence for context
  def process string, context=nil, date=Time.now
    words = clean_and_tokenize string
    words_to_count = filter_words words
    counts = count_words words_to_count

    counts.each { |word, count|
      word_record = Word.find_by_word word
      #if word_record.blank?
      #  word_record = create_word_record word, string
      #end
      word_record ||= Word.create! word: word, context: context
      count_record = word_record.daily_counts.where(day: date.to_date).first
      count_record ||= DailyCount.create! count: 0, day: date.to_date, word: word_record
      count_record.count += count
      count_record.save!
    }
  end


  def clean_and_tokenize string
    s = string.gsub(/\n/, ' ').gsub(/ /, '_').gsub(/_/, ' ').downcase
    words = s.split(' ').compact
    long_words = words.select { |w| (w.length > 3 && w.length < 255) }
    return long_words
  end

  def filter_words words
    filtered_words = words.select { |w| !@blacklist.include?(w) && !w.match(/\W/) }
    return filtered_words
  end

  def count_words words
    counts = {}

    words.each { |word|
      counts[word] ||= 0
      counts[word] += 1
    }

    return counts
  end

  def create_word_record word, string

  end

end