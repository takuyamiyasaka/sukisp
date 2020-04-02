class GestInquiry < ApplicationRecord
	has_one :answer

	validates :gest_request, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :gest_email, presence: true, length:{maximum:255},
						   format:  { with: VALID_EMAIL_REGEX }
end
