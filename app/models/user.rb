class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :image,  blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }
  validates :username, presence: true
  validates :profile, length: { maximum: 50 }  
  validates :password, presence: true, confirmation: true, length: { in: 6..30 }, on: :acount_update
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true, on: :acount_update
end
