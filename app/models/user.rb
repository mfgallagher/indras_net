class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions, dependent: :destroy
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         

  def feed
    Question.where("user_id = ?", id)
  end
  
end
