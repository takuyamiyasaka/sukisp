class Admins::InquiriesController < ApplicationController
  before_action :authenticate_admin!
  def show
	@inquiry = Inquiry.find(params[:id])
  	@answer = Answer.new
  	@answer.inquiry_id = params[:id]
  end

  def edit
  	@inquiry = Inquiry.find(params[:id])
  end

  def index
    @inquiries = Inquiry.all
  end

  def update
  	inquiry = Inquiry.find(params[:id])
  	if params[:inquiry][:unsolved] == "false"
  		inquiry.unsolved = false
  		inquiry.update(inquiry_params)
  		redirect_to admins_inquiry_path(inquiry)
  	else
  	inquiry.unsolved = true
  	inquiry.update(inquiry_params)
  	redirect_to admins_inquiry_path(inquiry)
  	end
  end

  private

  def inquiry_params
  	params.require(:inquiry).permit(:unsloved)
  end
end
