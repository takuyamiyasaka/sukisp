class Comment < ApplicationRecord

	belongs_to :customer
	belongs_to :topick
	attachment :image
end
