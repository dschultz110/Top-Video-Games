class GamesController < ApplicationController
  def index
    if params[:search]
      @search_term = params[:search]
      @search = true
      @games = Game.search_by(@search_term).paginate(:page => params[:page], per_page: 50)
    else
      @games = Game.includes(:publisher, :genre)
                    .order("name ASC").paginate(:page => params[:page], per_page: 50)
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
