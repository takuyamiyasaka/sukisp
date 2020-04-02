class Admins::AnswersController < ApplicationController
  before_action :authenticate_admin!


  def create
    unless params[:inquiry_id].nil?
  	 answer = Answer.new(answer_params)
     if answer.inquiry.is_receive == true
       inquiry = answer.inquiry.request
       customer = answer.inquiry.customer
    	 answer.save
       ContactMailer.send_when_admin_answer(customer,answer,inquiry).deliver
       redirect_to top_admins_topicks_path
    else
      answer.save
      redirect_to top_admins_topicks_path
    end
    else
    answer = Answer.new(gest_answer_params)
    answer.save
    binding.pry
    redirect_to top_admins_topicks_path
  end
  end

  private

  def answer_params
  	params.require(:answer).permit(:inquiry_id, :answer)
  end

  def gest_answer_params
    params.require(:answer).permit(:answer)
  end
end
