class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  has_many :topicks, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :profile_image

end
