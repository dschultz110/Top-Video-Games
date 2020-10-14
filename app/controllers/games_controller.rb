class GamesController < ApplicationController
  def index
    if params[:search]
      @search_term = params[:search]
      @search = true
      @games = Game.search_by(@search_term)
    else
      @games = Game.includes(:publisher, :genre).order("name ASC")
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
