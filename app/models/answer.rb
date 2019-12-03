class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) } 
  
  validates :question_id, presence: true
  validates :user_id, presence: true
  
  validates :content, presence: true, length: { maximum: 5000 }
  
end
