class TopicksController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :show, :index]
  def top
  end

  def about
  end

  def index
    @topicks = Topick.all
  end

  def new
    @topick = Topick.new
    @topick.topick_images.build
  end

  def create
    @topick = Topick.new(topick_params)
    @topick.customer_id = current_customer.id
    @topick.save
    redirect_to topick_path(@topick)
  end

  def show
    @topick = Topick.find(params[:id])
  end

  def edit
  end

  private
  def topick_params
    params.require(:topick).permit(:genre_id,:topick_name, :introduction, topick_images_topick_images:[])
  end
end
