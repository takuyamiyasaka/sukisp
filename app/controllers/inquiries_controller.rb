class InquiriesController < ApplicationController
  def new
  	@inquiry = Inquiry.new
  end

  def create
  	inquiry = Inquiry.new(inquiry_params)
  	inquiry.customer_id = current_customer.id
  	if inquiry.save
  		redirect_to root_path
  	end
  end

  private
  def inquiry_params
  	params.require(:inquiry).permit(:request)
  end
end
