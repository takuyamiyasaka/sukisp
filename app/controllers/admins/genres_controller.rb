class Admins::GenresController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@genres = Genre.all
    @genre = Genre.new
  end

  def show
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
  	genre = Genre.new(genre_params)
  	genre.save
  	redirect_to admins_genres_path
  end

  def update
    genre = Genre.find(params[:id])
    if params[:genre][:is_valid] == "true"
    genre.is_valid = true
    genre.update(genre_params)
    redirect_to admins_genres_path
   else
    genre.is_valid = false
    genre.update(genre_params)
    redirect_to admins_genres_path
   end
  end

  private

  def genre_params
  	params.require(:genre).permit(:genre_name)
  end

end
