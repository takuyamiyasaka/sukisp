class Admins::InquiriesController < ApplicationController
  def show
	@inquiry = Inquiry.find(params[:id])
  	@answer = Answer.new
  	@answer.inquiry_id = params[:id]
  end
end
