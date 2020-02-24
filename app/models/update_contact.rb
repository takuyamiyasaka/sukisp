class UpdateContact < ApplicationRecord
	validates :contact, presence: true
end
