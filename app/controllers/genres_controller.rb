class GenresController < ApplicationController
	before_action :authenticate_customer!, except: [:index, :show]

  def index
  	@genres = Genre.all
  end

  def show
  	@genre = Genre.find(params[:id])
  end
end
