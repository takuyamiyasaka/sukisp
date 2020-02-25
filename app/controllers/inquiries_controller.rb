class InquiriesController < ApplicationController
before_action :authenticate_customer!

  def new
  	@inquiry = Inquiry.new
  end

  def create
  	@inquiry = Inquiry.new(inquiry_params)
  	@inquiry.customer_id = current_customer.id
  	if @inquiry.save
       ContactMailer.send_when_admin_reply(current_customer).deliver
  		 redirect_to root_path
    else
      redirect_to request.referer,notice:"問い合わせに失敗しました。"
  	end
  end

  private

  def inquiry_params
  	params.require(:inquiry).permit(:request,:unsloved,:is_receive)
  end
end
