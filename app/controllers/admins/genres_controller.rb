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
  	@genre = Genre.new(genre_params)
  	if @genre.save
  	   redirect_to admins_genres_path
     else
      @genres = Genre.all
      render :index
  end
end

  def update
    @genre = Genre.find(params[:id])
    if params[:genre][:is_valid] == "true"
    @genre.is_valid = true
    if @genre.update(genre_params)
        redirect_to admins_genres_path
      else
        render :edit
    end
   else
    @genre.is_valid = false
    if @genre.update(genre_params)
        redirect_to admins_genres_path
      else
        render :edit
    end
   end
  end

  private

  def genre_params
  	params.require(:genre).permit(:genre_name)
  end

end
