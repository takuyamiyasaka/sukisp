class TopickImage < ApplicationRecord
	belongs_to :topick
	attachment :topick_image
end
