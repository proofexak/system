class User < ActiveRecord::Base
	self.inheritance_column = nil
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :customer
  has_one :employee

  def admin?
  	type == "admin"
  end
end
