class User < ApplicationRecord
  
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions, dependent: :destroy
  has_many :community_users
  has_many :communities, :through => :community_users
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
         

  def feed
    Question.where("user_id = ?", id)
  end
  
end
