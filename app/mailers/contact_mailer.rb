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

	def send_no_login_admin_reply(gest_inquiry)
		@name = gest_inquiry.gest_name
		mail to: gest_inquiry.gest_email, subject: "Sukisp お問い合わせありがとうございます。"
	end

	def send_no_login_admin_answer(answer,inquiry)
		@name = inquiry.gest_name
		@answer = answer.gest_answer
		@inquiry = inquiry.gest_request
		mail to: inquiry.gest_email, subject:"Sukisp お問い合わせ回答"
	end
end
