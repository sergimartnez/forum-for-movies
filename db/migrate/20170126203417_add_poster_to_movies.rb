class AddPosterToMovies < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :movies, :poster
  end
  def self.down
  	remove_attachment :movies, :poster
  end
end
