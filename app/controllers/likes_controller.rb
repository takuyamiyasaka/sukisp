class LikesController < ApplicationController

	def create
		@topick = Topick.find(params[:topick_id])
		like = current_customer.likes.new(topick_id: @topick.id)
		like.save
	end

	def destroy
		@topick = Topick.find(params[:topick_id])
		like = current_customer.likes.find_by(topick_id: @topick.id)
		like.destroy
	end
end
