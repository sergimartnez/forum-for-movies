require 'imdb'

class Movie < ApplicationRecord
	# has_attached_file :poster, styles: {:medium => "300x300>", :thumb => "100x100>"}
	# validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\z/
	has_many :comments
	class << self
		def search_movies_db term
			where("description like ? OR title like ?", "%#{term}%", "%#{term}%")
		end

		def search_movies_imdb term
			search = Imdb::Search.new(term)
			if search
				search.movies.first(20)
			else
				nil
			end
		end
	end
end
