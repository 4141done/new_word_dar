class WordCounter

  # http://wordlist.sourceforge.net/12dicts-readme.html#2of12inf
  # d = File.open('lib/2of12inf.txt').lines.map { |word| word.strip.downcase }
  def initialize blacklist=[]
    @blacklist = Set.new blacklist
    @contexts = {}
  end

  def process string, date=Time.now
    words_with_context = clean_and_tokenize_with_context string
    words_to_count = filter_words words_with_context
    counts = count_words words_to_count

    counts.each { |word_with_context, count|
      word = word_with_context[0]
      context = word_with_context[1]
      word_record = Word.find_by_word word
      word_record ||= Word.create! word: word, context: context
      count_record = word_record.daily_counts.where(day: date.to_date).first
      count_record ||= DailyCount.create! count: 0, day: date.to_date, word: word_record
      count_record.count += count
      count_record.save!
    }
  end


  def clean_and_tokenize_with_context string
    words = []
    sentences = string.split(/[.!?] |\n/)
    sentences.each { |sentence|
      s = sentence.gsub(/\n/, ' ').gsub(/ /, '_').gsub(/_/, ' ').downcase
      sentence_words = s.split(' ').compact
      sentence_words = sentence_words.select { |w| (w.length > 3 && w.length < 255) }
      words = words + sentence_words.map { |sw| [sw, sentence[0...255]] }
    }
    return words
  end

  def filter_words words_with_context
    filtered_words = words_with_context.select { |w| !@blacklist.include?(w[0]) && !w[0].match(/\W/) }
    return filtered_words
  end

  def count_words words_with_context
    counts = {}

    words_with_context.each { |word_with_context|
      counts[word_with_context] ||= 0
      counts[word_with_context] += 1
    }

    return counts
  end

end