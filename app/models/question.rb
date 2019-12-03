class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  
  default_scope -> { order(created_at: :desc)  }
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 10000 }
end
