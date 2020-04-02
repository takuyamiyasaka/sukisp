class Admins::GestInquiriesController < ApplicationController
	 before_action :authenticate_admin!
	def show
		@gest_inquiry = GestInquiry.find(params[:id])
		@answer = Answer.new
	end

	def update
	  	@gest_inquiry = GestInquiry.find(params[:id])
  		if params[:gest_inquiry][:unsolved] == "false"
  		 @gest_inquiry.unsolved = false
  		 @gest_inquiry.update(gest_inquiry_params)
  		 redirect_to top_admins_topicks_path
  		else
  	   	 @gest_inquiry.unsolved = true
  	     @gest_inquiry.update(gest_inquiry_params)
  	     redirect_to top_admins_topicks_path
  	  end
	end

	private

	def gest_inquiry_params
		params.require(:gest_inquiry).permit(:unsolved)
	end
end
