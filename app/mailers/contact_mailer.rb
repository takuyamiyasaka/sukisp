class ContactMailer < ApplicationMailer

	def send_when_admin_reply(customer)
		@customer = customer
		mail to: customer.email, subject: "Sukisp お問い合わせありがとうございます。"
	end
end
