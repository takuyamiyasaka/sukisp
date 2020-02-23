class Admins::TopicksController < ApplicationController
  def index
  	@genres = Genre.all
  end

  def top
  	@inquiries = Inquiry.where(unsolved: true)
  	@contact = UpdateContact.new
  end

  def show
  	@topick = Topick.find(params[:id])
  end
end
