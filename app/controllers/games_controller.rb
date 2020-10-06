class GamesController < ApplicationController
  def index
    @games = Game.includes(:publisher, :genre).order("sales DESC")
  end

  def show
    @game = Game.find(params[:id])
  end
end
