class TopicksController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :show, :index]
  require "open-uri"
  impressionist :actions=>[:show]


  def top
    @topick_now = Topick.where(created_at: 0.day.ago.all_day)
    @contacts = UpdateContact.all.reverse
    country = params.dig(:search, :country) || 'jp'
    url = "https://newsapi.org/v2/top-headlines?country=#{country}&apiKey="+ENV['API']
    req = open(url)
    @response = JSON.parse req.read

    @recently_topicks = Topick.order("created_at desc")
    @top_topicks = Topick.find(Like.group(:topick_id).order("count(topick_id) desc").limit(3).pluck(:topick_id))
  end

  def about
    @topicks = Topick.all
    @customers = Customer.all
  end

  def index
    if params[:genre_id]
       genre = Genre.find(params[:genre_id])
       @topicks = genre.topicks.page(params[:page])
    elsif params[:customer_id]
       customer = Customer.find(params[:customer_id])
       @topicks = customer.topicks.page(params[:page])
    else
       @topicks = Topick.page(params[:page])
    end
  end

  def new
    @topick = Topick.new
    @topick.topick_images.build
  end

  def create
    @topick = Topick.new(topick_params)
    @topick.customer_id = current_customer.id
    if @topick.save
       redirect_to topick_path(@topick)
    else
       render :new
    end
  end

  def show
    @topick = Topick.find(params[:id])
    @comment = Comment.new
    impressionist(@topick)
  end

  def edit
    @topick = Topick.find(params[:id])
    if @topick.customer == current_customer
    else
      redirect_to topick_path(@topick)
    end
  end

  def update
    @topick = Topick.find(params[:id])
    if @topick.customer ==current_customer
        if @topick.update(topick_params)
            redirect_to topick_path(@topick)
        else
            render :edit
        end
    else
      redirect_to topick_path(@topick)
    end
  end

  def destroy
    topick = Topick.find(params[:id])
    if topick.customer == current_customer
        topick.topick_images.delete_all
        topick.delete
        redirect_to topicks_path
    else
        redirect_to topicks_path
    end
  end

  private
  def topick_params
    params.require(:topick).permit(:genre_id,:topick_name, :introduction, topick_images_topick_images:[])
  end
end
