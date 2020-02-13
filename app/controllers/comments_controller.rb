class CommentsController < ApplicationController
	before_action :authenticate_customer!
	def create
		@topick = Topick.find(params[:topick_id])
		comment = current_customer.comments.new(comment_params)
		comment.topick_id = @topick.id
		comment.save
		@topick_comment = @topick.comments
	end

	def destroy
		@topick = Topick.find(params[:topick_id])
		comment = Comment.find(params[:id])

		if comment.customer.id == current_customer.id
			comment.destroy
			@topick_comment = @topick.comments
		else
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:customer_id, :topick_id, :image, :comment)
	end
end
