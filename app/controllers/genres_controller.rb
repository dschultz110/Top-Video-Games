class GenresController < ApplicationController
  def index
    @genres = Genre.order("name ASC")
  end

  def show
    @genre = Genre.find(params[:id])
    @games = @genre.games.order("name ASC")
  end
end
