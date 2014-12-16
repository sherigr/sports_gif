class SessionsController < ApplicationController

	def new
	end

	def create
		 user = User.find_by(username: params[:username])
		 if user && user.authentication(params[:password])
		 	session[:current_user_id] = user.current_user_id
		 	redirect_to users_path
		 else
		 	redirect_to login_path
		 end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to users_path
	end

end