class ContactMailer < ApplicationMailer

	def send_when_admin_reply(customer)
		@customer = customer
		mail to: customer.email, subject: "Sukisp お問い合わせありがとうございます。"
	end

	def send_when_admin_answer(customer,answer,inquiry)
		@customer = customer
		@answer = answer.answer
		@inquiry = inquiry
		mail to: customer.email,subject:"Sukisp お問い合わせ回答"
	end
end
