class Admins::TopicksController < ApplicationController
  def index
  	@topick = Topick.all
  end

  def top
  	@inquiries = Inquiry.where(unsolved: true)
  	@contact = UpdateContact.new
  end

  def show
  	@topick = Topick.find(params[:id])
  end

  def edit
    @topick = Topick.find(params[:id])
  end

  def update
    topick = Topick.find(params[:id])
    topick.update(admin_topick_params)
    redirect_to admins_topicks_path
  end

  def destroy
    topick = Topick.find(params[:id])
    topick.topick_images.delete_all
    topick.delete
    redirect_to admins_topicks_path
  end

  private
  def admin_topick_params
    params.require(:topick).permit(:genre_id,:topick_name, :introduction, topick_images_topick_images:[])
  end
end
