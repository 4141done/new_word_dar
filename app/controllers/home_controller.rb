class HomeController < ApplicationController
  def index
    @words = Word.all
    if @words.empty?
      @helpful_hint = true
    end
  end
end