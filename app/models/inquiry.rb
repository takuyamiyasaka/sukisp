class Inquiry < ApplicationRecord
	belongs_to :customer
	has_one :answer

	validates :request ,presence: true
end
