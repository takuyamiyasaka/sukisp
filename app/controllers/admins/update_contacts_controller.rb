class Admins::UpdateContactsController < ApplicationController

	def create
		contact = UpdateContact.new(contact_params)
		contact.save
		redirect_to top_admins_topicks_path
	end
	private
	def contact_params
		params.require(:update_contact).permit(:contact)
	end
end
