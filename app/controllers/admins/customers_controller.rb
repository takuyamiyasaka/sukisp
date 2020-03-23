class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@q = Customer.ransack(params[:q])#gem ransack追加
		#上の記述だけで簡単なソート機能が使える
		@customers = @q.result(distinct: true).with_deleted
	end

	def show
		@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
		@customer = Customer.with_deleted.find(params[:id])
	end

	def update
		@customer = Customer.with_deleted.find(params[:id])
		if params[:customer][:deleted_at] == "true"
			if @customer.update(customer_params)
				@customer.restore
				redirect_to admins_customer_path(@customer)
			else
				render :edit
			end
		else
			if @customer.update(customer_params)
				@customer.destroy
				redirect_to admins_customer_path(@customer)
			else
				render :edit
			end
		end
	end

	private
	def customer_params
		params.require(:customer).permit(:name, :public_name, :profile_image,:email ,:deleted_at)
	end
end
