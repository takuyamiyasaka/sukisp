class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@customers = Customer.with_deleted
	end

	def show
		@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
		@customer = Customer.with_deleted.find(params[:id])
	end

	def update
		customer = Customer.with_deleted.find(params[:id])
		if params[:customer][:deleted_at] == "true"
			customer.update(customer_params)
			customer.restore
			customer.topicks
			byebug
			customer.topicks.topick_images.restore
			redirect_to admins_customer_path(customer)
		else
			customer.update(customer_params)
			customer.destroy
			redirect_to admins_customer_path(customer)
		end
	end

	private
	def customer_params
		params.require(:customer).permit(:name, :public_name, :profile_image,:email ,:deleted_at)
	end
end
