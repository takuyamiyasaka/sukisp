class GestAnswer < ApplicationRecord
  belongs_to :gest_inquiry
  validates :gest_answer, presence: true
end
