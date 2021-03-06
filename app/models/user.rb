class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable,
         # Using devise to validate email, password validation is supplemented
         :validatable, 
         omniauth_providers: %i[twitter]
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.nickname 
      
    end
  end
  
  # Assumes that every twitter user whow signs in will have an email linked to their twitter
  # User will most likely not work properly with Devise or Gravatar which require emails
  def email_required?
    false
  end
  
  # 8-20 characters not counting special characters
  PASSWORD_FORMAT = /(?:\w[^\w]*){8,20}\z/x
  
  # Override devise validations
  validates :username, presence: true
  
  validates :password, 
    presence: true, 
    length: { in: Devise.password_length }, 
    format: { with: PASSWORD_FORMAT }, 
    confirmation: true, 
    on: :create 
  
  has_many :orders
  
  has_one_attached :avatar
end
