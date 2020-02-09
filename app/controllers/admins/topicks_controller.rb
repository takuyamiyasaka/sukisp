class Admins::TopicksController < ApplicationController
  def index
  	@genres = Genre.all
  end

  def show
  	@topick = Topick.finde(params[:id])
  end
end
