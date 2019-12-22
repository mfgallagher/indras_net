class Community < ApplicationRecord
  
  has_many :community_users
  has_many :users, :through => :community_users
  has_many :questions
  has_many :answers, through: :questions
  
  validates :name, presence: true, length: { maximum: 150 }
  
end
