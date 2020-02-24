class Topick < ApplicationRecord
	belongs_to :genre
	belongs_to :customer
	has_many :comments, 		dependent: :destroy
	has_many :topick_images,	dependent: :destroy
	has_many :likes, 			dependent: :destroy
	accepts_attachments_for :topick_images, attachment: :topick_image
	is_impressionable counter_cache: true

	validates :topick_name, presence: true
	validates :introduction, presence: true
	# is_impressionable
	def liked_by?(customer)
		likes.where(customer_id: customer.id).exists?
	end
end
