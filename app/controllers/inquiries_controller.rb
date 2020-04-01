class InquiriesController < ApplicationController

  def new
  	@inquiry = Inquiry.new
  end

  def create
    if customer_signed_in?
  	 @inquiry = Inquiry.new(inquiry_params)
  	 @inquiry.customer_id = current_customer.id
  	 if @inquiry.save
        ContactMailer.send_when_admin_reply(current_customer).deliver
  		  redirect_to root_path
      else
        redirect_to request.referer,notice:"問い合わせに失敗しました。"
  	 end
    else
      @inquiry = Inquiry.new(not_login_inquiry_params)
      if @inquiry.save
        ContactMailer.send_no_login_admin_reply(@inquiry).deliver
        redirect_to root_path
      else
        redirect_to request.referer,notice:"お問い合わせに失敗しました。"
        binding.pry
      end
    end
  end

  private

  def inquiry_params
  	params.require(:inquiry).permit(:request,:unsloved,:is_receive)
  end

  def not_login_inquiry_params
    params.require(:inquiry).permit(:request,:unsloved,:is_receive,:inquiry_name,:inquiry_email)
  end
end
