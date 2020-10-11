class ApplicationController < ActionController::Base
  before_action :find_info

  def find_info
    @sidebar_genres = Genre.order("name ASC")
    @sidebar_platforms = Platform.order("name ASC")
    @sidebar_games = Game.order("sales DESC").limit(20)
  end
end
