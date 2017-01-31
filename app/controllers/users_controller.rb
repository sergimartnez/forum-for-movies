class UsersController < ApplicationController
	
	def login
		@user = User.new	
	end

	def check_login
		user = User.valid_user? params[:user][:username], params[:user][:password]
		if !user.nil?
			session[:current_user_id] = user.id
			flash[:notice] = "Logged in correctly!"
			redirect_to "/users/login"
		else
			flash[:notice] = "Please try again"
			redirect_to "/users/login"
		end
	end

	private

	def user_params
		params.require(:entry).permit(:username, :password)
	end
end
