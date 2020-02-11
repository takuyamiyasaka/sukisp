class CommentsController < ApplicationController
	before_action :authenticate_customer!
	def create
		topick = Topick.find(params[:topick_id])
		comment = current_customer.comments.new(comment_params)
		comment.topick_id = topick.id
		comment.save
		redirect_to topick_path(topick)
	end

	def destroy
		topick = Topick.find(params[:topick_id])
		comment = Comment.find(params[:id])

		if comment.customer.id == current_customer.id
			comment.destroy
			redirect_to request.referer
		else
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:customer_id, :topick_id, :image, :comment)
	end
end
