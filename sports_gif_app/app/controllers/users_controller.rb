class UsersController < ApplicationController

	def index
		@users = User.all 
	end

	def new
		@user = User.new
		render :new 
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html { redirect_to user_path(@user) }
				format.json { render json: @user }
			else
				forma.html { render :new }
				forma.json { render json: @user }
			end
		end
	end

	def edit
		@user = User.find(params[:id])
		render :edit 

	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to user_path(@user) }
				format.json { render json: @user }
			else
				format.html { render :edit }
				format.json { render :json @user }
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		respond_to do |format|
			@user.destroy
			format.html { redirect_to users_path }
			format.json { render json: @user }
		end
	end


	def user_params
		params.require(:user).permit(:first_name, :last_name, :favorite, :password, :password_confirmation)
	end
end

