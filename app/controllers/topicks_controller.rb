class TopicksController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :show, :index]
  require "open-uri"



  def top
    @topick_now = Topick.where(created_at: 0.day.ago.all_day)
    @contacts = UpdateContact.all.reverse
    country = params.dig(:search, :country) || 'jp'
    url = "https://newsapi.org/v2/top-headlines?country=#{country}&apiKey="+ ENV['API']
    req = open(url)
    @response = JSON.parse req.read
    category = params.dig(:search, :category)
    url = 'https://newsapi.org/v2/sources?apiKey='+ ENV['API']
    reqi = open(url)
    @source = JSON.parse reqi.read

    @source = @source['sources'].select { |s| s["category"] == category } if category.present?
  end

  def about
  end

  def index
    if params[:genre_id]
      genre = Genre.find(params[:genre_id])
      @topicks = genre.topicks
    else
      @topicks = Topick.all
    end
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
    @comment = Comment.new
  end

  def edit
    @topick = Topick.find(params[:id])
  end

  def update
    topick = Topick.find(params[:id])
    if topick.customer ==current_customer
        topick.update(topick_params)
        redirect_to topick_path(topick)
    else
    end
  end

  def destroy
    topick = Topick.find(params[:id])
    if topick.customer == current_customer
        topick.topick_images.delete_all
        topick.delete
        redirect_to topicks_path
    else
    end
  end

  private
  def topick_params
    params.require(:topick).permit(:genre_id,:topick_name, :introduction, topick_images_topick_images:[])
  end
end
