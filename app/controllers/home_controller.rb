class HomeController < ApplicationController
  def index
    @games = Game.includes(:publisher, :genre).order("sales DESC").limit(20)
    @platforms = Platform.limit(20)
    @genres = Genre.order("name ASC")
    @publishers = Publisher.limit(20)
  end
end
