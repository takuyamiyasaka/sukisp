class CustomersController < ApplicationController
	before_action :authenticate_customer!
  def show
  	@customer = Customer.find(params[:id])
    @inquiry = @customer.inquiries
    @i = Inquiry.all
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	customer = Customer.find(params[:id])
  	customer.update(customer_params)
  	redirect_to customer_path(customer)
  end

  def withdraw
  end

  def destroy
  	customer = current_customer
  	customer.destroy
  	redirect_to root_path
  end

  def follow
    customer = Customer.find(params[:id])
    @customers = customer.followings.all
  end
  def follower
    customer = Customer.find(params[:id])
    @customers = customer.followers.all
  end

  private
  def customer_params
  	params.require(:customer).permit(:profile_image, :name, :public_name,:self_introduction)
  end
end
