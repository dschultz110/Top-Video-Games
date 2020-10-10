class PublishersController < ApplicationController
  def index
    @publishers = Publisher.order("name ASC")
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
