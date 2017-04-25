
class User < ActiveRecord::Base

	has_many :countrys
	has_many :citys, through: :countrys
end