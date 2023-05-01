class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

	def in_out_check
		if room_check_in.present? && room_check_out.present?
			if room_check_in < Date.today
				errors.add(:room_check_in, :invalid)
			end
			
			if room_check_out <= room_check_in
				errors.add(:room_check_out, :invalid)
			end
		end
	end

    validates :room_check_in, presence: true 
    validates :room_check_out, presence: true
    validates :number_of_reserve, presence: true
    validate :in_out_check

end
