class GestInquiriesController < ApplicationController
  def new
  	@gest_inquiry = GestInquiry.new
  end

  def create
  	@gest_inquiry = GestInquiry.new(gest_inquiry_params)
    if @gest_inquiry.save
       ContactMailer.send_no_login_admin_reply(@gest_inquiry).deliver
       redirect_to root_path
    else
       redirect_to request.referer,notice:"お問い合わせに失敗しました。"
  	end
  end

  private

  def gest_inquiry_params
  	params.require(:gest_inquiry).permit(:gest_name,:gest_email,:gest_request,:unsolved)
  end
end
