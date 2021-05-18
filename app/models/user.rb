class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
         
  PASSWORD_FORMAT = /(?:\w[^\w]*){8,20}\z/x
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  # Override devise validations
  validates :username, presence: true
  
  validates :email, 
    presence: true,
    format: {with: EMAIL_FORMAT}
  
  validates :password, 
    presence: true, 
    # length: { in: Devise.password_length }, 
    format: { with: PASSWORD_FORMAT }, 
    confirmation: true, 
    on: :create 
  
end
