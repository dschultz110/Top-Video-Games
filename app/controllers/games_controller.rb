class GamesController < ApplicationController
  def index
    @games = Game.includes(:publisher, :genre).order("name ASC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
