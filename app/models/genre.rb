class Genre < ApplicationRecord
	has_many :topicks, dependent: :destroy

	validates :genre_name ,presence: true
end
