class UsersController < ApplicationController
	# before_action :check_auth, :only => [:edit, :update, :destroy]


	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end

	
	def edit
		@user = User.find(params[:id])
		render :edit
	end

	# def update
	# 	@user = User.find(params[:id])
	# 	if @user.update(user_params)
	# 		redirect_to @user
	# 	else
	# 		render :edit
	# 	end
	# end

	def update
		@user = User.find(params[:id])
		respond_to do |format| 
			if @user.update(user_params)
				format.html { redirect_to user_path(@user) }
				format.json { render json: @user }
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		respond_to do |format|
			@user.destroy		
			format.html { redirect_to root_path }
			format.json { render json: @user}

		end
	end


	def create_memory
		session[:current_name] = params[:name]
		redirect_to '/'
	end

	# def destroy
	# 	@user = User.find(params[:id])
	# 	@user.destroy

	# 	if @user.destroy
	# 		redirect_to root_path
	# 	end
	# end

	
	def destroy_memory
		session[:current_name] = nil
		redirect_to '/'
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
	end
end

