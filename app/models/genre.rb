class Genre < ApplicationRecord
	has_many :topicks, dependent: :destroy
end
