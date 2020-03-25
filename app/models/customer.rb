class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid

  has_many :topicks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships, source: :customer
  attachment :profile_image
  has_many :inquiries ,dependent: :destroy
  has_many :messages,  dependent:  :destroy
  has_many :entries,   dependent:  :destroy
  validates :public_name ,presence: true
  validates :name ,presence: true

  def follow(other_customer)
  	unless self == other_customer
  		self.relationships.find_or_create_by(follow_id: other_customer.id)
	end
  end

  def unfollow(other_customer)
  	relationship = self.relationships.find_by(follow_id: other_customer.id)
  	relationship.destroy if relationship
  end

  def following?(other_customer)
  	self.followings.include?(other_customer)
  end

end
