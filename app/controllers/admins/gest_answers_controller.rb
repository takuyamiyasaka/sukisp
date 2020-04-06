class Admins::GestAnswersController < ApplicationController
before_action :authenticate_admin!


  def create
	answer = GestAnswer.new(gest_answer_params)
    inquiry = answer.gest_inquiry
    answer.save
    ContactMailer.send_no_login_admin_answer(answer,inquiry).deliver
    redirect_to top_admins_topicks_path
  end

  private

  def gest_answer_params
  	params.require(:gest_answer).permit(:gest_inquiry_id, :gest_answer)
  end
end
