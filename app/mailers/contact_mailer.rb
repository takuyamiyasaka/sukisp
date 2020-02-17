class ContactMailer < ApplicationMailer

	def send_when_admin_reply(customer)
		@customer = customer
		mail to: customer.email, subject: "問い合わせ"
	end
end
