class Community < ApplicationRecord
  has_many :users
  has_many :questions, through: :users
  has_many :answers, through: :questions
  
  validates :name, presence: true, length: { maximum: 150 }
  
end
