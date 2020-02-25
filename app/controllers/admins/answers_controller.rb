class Admins::AnswersController < ApplicationController
  before_action :authenticate_admin!
  def new
  end

  def create
  	answer = Answer.new(answer_params)
    inquiry = answer.inquiry.request
    customer = answer.inquiry.customer
  	answer.save
    ContactMailer.send_when_admin_answer(customer,answer,inquiry).deliver

  	redirect_to top_admins_topicks_path
  end
  private
  def answer_params
  	params.require(:answer).permit(:inquiry_id, :answer)
  end
end
