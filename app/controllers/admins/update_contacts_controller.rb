class Admins::UpdateContactsController < ApplicationController
	before_action :authenticate_admin!
	def create
		contact = UpdateContact.new(contact_params)
		if contact.save
			redirect_to top_admins_topicks_path
		else
			redirect_to request.referer,notice:"お知らせに失敗しました。"
		end
	end

	private
	def contact_params
		params.require(:update_contact).permit(:contact)
	end
end
