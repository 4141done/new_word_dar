class WordCounter

  # TODO: NEXT STEP is to be able to add words to a blacklist via the UI
  # This entails adding all blacklist words to the DB, thinking there might be
  # a source for blacklist word as well (e.g. wikipedia, unix, etc)

  # http://wordlist.sourceforge.net/12dicts-readme.html#2of12inf
  # d = File.open('lib/2of12inf.txt').lines.map { |word| word.strip.downcase }
  def initialize skip_words=[]
    @skip_words= Set.new skip_words
  end

  def process string, date=Time.now
    @contexts = []
    words_with_context = clean_and_filter_with_context string
    counts = count_words words_with_context

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

  def clean_and_filter_with_context string
    print "Cleaning"
    words = []
    sentences = string.split(/[.!?] |\n/)
    sentences.each { |sentence|
      print '.'
      s = sentence.gsub(/\n/, ' ').gsub(/ /, '_').gsub(/_/, ' ').downcase
      sentence_words = s.split(' ').compact
      sentence_words = filter_words(sentence_words)
      words = words + sentence_words.map { |sw| [sw, sentence[0...255]] }
    }
    return words
  end

  def filter_words words
    return words.select { |w|
      (w.length > 3 && w.length < 255) &&
        !@skip_words.include?(w) &&
        !w.match(/\W/) &&
        w.match(/^[a-z]/) }
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