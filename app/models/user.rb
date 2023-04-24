class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  
  validates :image,  blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }
  
  validates :username, presence: true
  
  validates :profile, length: { maximum: 50 }  
  
end

