class PlatformsController < ApplicationController
  def index
    @platforms = Platform.order("name ASC")
  end

  def show
    @platform = Platform.find(params[:id])
    @games = @platform.games.order("name ASC")
  end
end
