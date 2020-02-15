class Admins::AnswersController < ApplicationController
  def new
  end

  def create
  	answer = Answer.new(answer_params)
  	answer.save
  	redirect_to top_admins_topicks_path
  end
  private
  def answer_params
  	params.require(:answer).permit(:inquiry_id, :answer)
  end
end
