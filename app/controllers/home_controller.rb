class HomeController < ApplicationController
  def index
    @words = Word.all
    if @words.empty?
      @helpful_hint = true
    end
  end

  def refresh_statistics
    @words = Word.all
    @words.each do |word|
      word.refresh_statistics
    end
    redirect_to :root
  end
end