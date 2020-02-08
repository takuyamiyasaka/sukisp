class Admins::GenresController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@genres = Genre.all
    @genre = Genre.new
  end

  def show
  end

  def edit
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to admins_genres_path
  end

  def destory
  end

  private

  def genre_params
  	params.require(:genre).permit(:genre_name)
  end

end
