class Topick < ApplicationRecord
	belongs_to :genre
	belongs_to :customer
	has_many :comments, 		dependent: :destroy
	has_many :topick_images,	dependent: :destroy
	has_many :likes, 			dependent: :destroy
	accepts_attachments_for :topick_images, attachment: :topick_image

	def liked_by?(customer)
		likes.where(customer_id: customer.id).exists?
	end
end
