class PlatformsController < ApplicationController
  def index
    @platforms = Platform.order("name ASC")
  end

  def show
    @platform = Platform.find(params[:id])
    @games = @platform.games.order("name ASC").paginate(:page => params[:page], per_page: 50)
  end
end
