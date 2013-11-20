class SkipWordImporter
  def initialize
    @existing_skip_words = Set.new(
      SkipWord.all_words
    )
  end

  def import_file file
    ap "Importing skip words from #{file}"

    batch = []
    batch_size = 1000
    num_words_imported = 0
    num_words_duplicate = 0

    lines = File.readlines("#{file}")
    ap "Contains #{lines.size} words"
    lines.each { |word|
      word = word.downcase.strip
      if @existing_skip_words.include? word
        num_words_duplicate += 1
      else
        batch << SkipWord.new(word: word, source: file)
        @existing_skip_words.add(word)
        num_words_imported += 1
      end

      if batch.size >= batch_size
        SkipWord.import batch
        batch = []
        ap "#{num_words_imported} skip words imported"
      end
    }
    SkipWord.import batch

    ap "#{num_words_imported} skip words imported"
    ap "#{num_words_duplicate} skip words duplicate"
  end
end