class Admins::TopicksController < ApplicationController
  def index
  	@genres = Genre.all
  end

  def top
  	@inquiries = Inquiry.all
  	@contact = UpdateContact.new
  end

  def show
  	@topick = Topick.finde(params[:id])
  end
end
