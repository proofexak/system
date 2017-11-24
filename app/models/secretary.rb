class Secretary < ActiveRecord::Base
	belongs_to :user

	validates :first_name, :last_name, :telephone_number, presence: true
	validates :telephone_number, length: {in: 9..12}
  	validates :telephone_number, numericality: { only_integer: true }
end
