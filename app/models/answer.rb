class Answer < ApplicationRecord
	belongs_to :inquiry

	validates :answer, presence: true
end
