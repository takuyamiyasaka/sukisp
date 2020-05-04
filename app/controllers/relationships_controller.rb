class RelationshipsController < ApplicationController

	before_action :set_customer

	def create
		following = current_customer.follow(@customer)
		if following.save
			flash[:success] = "フォロー完了"
			RelationshipMailer.following_notification(current_customer,@customer).deliver_now
		else
			flash.now[:alert] = "フォローに失敗しました"
			redirect_to customer_path(customer)
		end
	end

	def destroy
		following = current_customer.unfollow(@customer)
		if following.destroy
			flash[:success] = "ユーザーのフォロー解除"
			RelationshipMailer.followed_notification(current_customer,@customer).deliver_now
		else
			flash.now[:aleert] = "ユーザーのフォロー解除失敗しました"
			redirect_to customer_path(customer)
		end
	end

	private

	def set_customer
		@customer = Customer.find(params[:follow_id])
	end

end
