class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order("name ASC").paginate(:page => params[:page], per_page: 50)
  end

  def show
    @publisher = Publisher.find(params[:id])
    @games = @publisher.games.order("name ASC").paginate(:page => params[:page], per_page: 50)
  end
end
