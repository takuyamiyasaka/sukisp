class Inquiry < ApplicationRecord
	belongs_to :customer
	has_one :answer
end
