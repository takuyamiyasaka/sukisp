class RelationshipMailer < ApplicationMailer

	def following_notification(current_customer,follower)
		@customer = current_customer
		@follower = follower
		mail to: @follower.email, subject: "#{@customer.public_name}さんがフォローしました"
	end

	def followed_notification(current_customer,follower)
		@customer = current_customer
		@follower = follower
		mail to: @follower.email, subject: "#{@customer.public_name}さんがフォローをはずしました"
	end
end
