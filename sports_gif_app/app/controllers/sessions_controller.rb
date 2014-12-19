class SessionsController < ApplicationController


	def new
	end

	def create
		 user = User.find_by(email: params[:email])
		 if user && user.authenticate(params[:password])
		 	session[:current_user_id] = user.id
		 	redirect_to root_path
		 else
		 	redirect_to login_path
		 end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_path
	end

end