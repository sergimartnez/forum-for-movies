# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create Users

25.times do
	name = Faker::Name.first_name
	password = "test123"
	User.create(username: name,
							password: password)
end

# Create some movies in DB

title = "El señor de los anillos"
description = "Historia de como terminar con el mal en la edad Media y destruir el anillo"
# poster = Faker::Avatar.image(slug = nil, size = '300x300', format = 'png')
movie = Movie.new(title: title,
									description: description,
									)
movie.save

title = "Intocable"
description = "Historia de un señor paralítico y su cuidador negro y la amistad que surje entre ellos"
# poster = Faker::Avatar.image(slug = nil, size = '300x300', format = 'png')
movie = Movie.new(title: title,
									description: description)
movie.save

# Create more Movies in DB

15.times do
	title = Faker::Name.name
	description = Faker::Lorem.sentence
	# poster = Faker::Avatar.image(slug = nil, size = '300x300', format = 'png')
	movie = Movie.new(title: title,
										description: description)
	movie.save
end

# Create comments on movies

Movie.all.each do |movie|
	3.times do
		user = User.order("RANDOM()").first
		text = Faker::Lorem.sentence
		comment = Comment.new(comment: text,
													user: user,
													movie: movie)
		comment.save
	end
end
