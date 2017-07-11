class Employee < ActiveRecord::Base
	belongs_to :user
	has_many :working_hours

	validates :first_name, :last_name, :telephone_number, 
        :position, presence: true
  validates :telephone_number, length: {in: 9..12}
  validates :telephone_number, numericality: { only_integer: true }
end
