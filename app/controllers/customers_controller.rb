class CustomersController < ApplicationController
	before_action :authenticate_customer!
  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  end
end
