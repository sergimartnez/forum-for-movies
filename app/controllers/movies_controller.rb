class MoviesController < ApplicationController
	def search
		render 'search'
	end

	def show_search_results
		term = params[:search]
		@movies = Movie.search_movies_db term
		if !@movies.any?
			@movies = Movie.search_movies_imdb term
			render 'show_search_results_imdb'
		else
			render 'show_search_results_db'
		end
	end

	def create	
		# binding.pry
		new_movie = Imdb::Movie.new(params[:id])
		movie = Movie.new(title: new_movie.title,
							 				description: new_movie.plot)
		movie.save
		redirect_to "/movies/#{movie.id}"
	end

	def show
		@movie = Movie.find_by(id: params[:id])
		@comment = Comment.new

		if @movie.nil?
			flash[:notice] = "The movie has not been found! Search by term:"
			render "/movies/search"
		else
			render 'show'
		end
	end

	def create_comment
		# binding.pry
		@comment = Comment.new(comment: params[:comment][:comment], 
			user_id: session[:current_user_id],
			movie_id: params[:movie_id].to_i)

		@comment.save
		redirect_to "/movies/#{params[:movie_id]}"
	end
end
