class CustomersController < ApplicationController
	before_action :authenticate_customer!

  def show
  	@customer = Customer.find(params[:id])
    #エントリーしているＩＤをすべて持ってきている
    @current_customer_entry = Entry.where(customer_id: current_customer.id)
    @other_customer_entry = Entry.where(customer_id: @customer.id)
    unless @customer.id == current_customer.id
      #マイページだと処理はない
      @current_customer_entry.each do |current|
        @other_customer_entry.each do |other|
          #entryを並べてroom_idをチッェク
          if current.room_id == other.room_id
            @isRoom = true
            @roomId = current.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
    @inquiry = @customer.inquiries
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  	   redirect_to customer_path(@customer)
     else
      render :edit
    end
  end

  def withdraw
    @customer = Customer.find(params[:id])
  end

  def destroy
  	customer = Customer.find(params[:id])
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
