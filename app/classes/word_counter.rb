class WordCounter

  def initialize blacklist=[]
    @blacklist = Set.new blacklist
  end

  def process string, context=nil, date=Time.now
    words = clean_and_tokenize string
    words_to_count = filter_words words
    counts = count_words words_to_count

    counts.each { |word, count|
      word_record = Word.find_by_word word
      word_record ||= Word.create! word: word, context: context
      count_record = word_record.daily_counts.where(day: date).first
      count_record ||= DailyCount.create! count: 0, day: date, word: word_record
      count_record.count += count
      count_record.save!
    }
  end


  def clean_and_tokenize string
    s = string.gsub(/ /, '_').gsub(/[\W]/, '').gsub(/_/, ' ').downcase
    words = s.split(' ').compact
    long_words = words.select { |w| w.length > 3 }
    return long_words
  end

  def filter_words words
    filtered_words = words.select { |w| !@blacklist.include?(w) }
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

end