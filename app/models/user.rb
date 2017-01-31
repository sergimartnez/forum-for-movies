class User < ApplicationRecord
	has_many :comments
	has_many :movies, :through => :comments, :source => :movie
	class << self
		def valid_user? user, pass
			find_by("username = ? AND password = ?", user, pass)
		end
	end
end
