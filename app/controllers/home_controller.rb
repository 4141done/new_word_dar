class HomeController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @words = Word.order(sort_column + " " + sort_direction + ", word ASC").paginate(:page => params[:page])
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

  private

  def sort_column
    Word.column_names.include?(params[:sort]) ? params[:sort] : "word"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end