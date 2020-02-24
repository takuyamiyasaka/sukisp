class Comment < ApplicationRecord

	belongs_to :customer
	belongs_to :topick
	attachment :image

	validates :comment ,presence: true
end
