class SkipWordsController < ApplicationController
  def index
    @skip_words = SkipWord.where(source: 'manual')
  end

  def create
    word = params[:word]
    if SkipWord.find_by_word(word).present?
      message = 'This word has already been added to the list of skip words.'
    else
      SkipWord.create(word: word, source: 'manual')
      message = "#{word} has been added to the list of skip words."
    end
    Word.find_by_word(word).destroy
    flash[:notice] = message
  end
end