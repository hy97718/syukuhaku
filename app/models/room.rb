class Room < ApplicationRecord
  belongs_to :user
  has_one_attached :room_image
  has_many :reservations

  validates :room_title, presence: true
  validates :room_info, presence: true, length: { maximum: 200 } 
  validates :room_price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  validates :address, presence: true


  def self.search(keyword,area)
		if keyword.present?
			Room.where(['room_title LIKE ? OR room_info LIKE ?', "%#{keyword}%", "%#{keyword}%" ])
		elsif area.present?
		Room.where(['address LIKE ? ', "#{area}%" ])	
		else
			Room.all
		end
  end
end
