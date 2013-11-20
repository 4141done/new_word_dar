class SkipWord < ActiveRecord::Base
  def self.all_words
    all_words = ActiveRecord::Base.connection.execute('select word from skip_words')
    all_words.map { |w| w['word'] }
  end
end