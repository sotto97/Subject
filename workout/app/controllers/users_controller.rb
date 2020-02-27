class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@excercise_new = Excercise.new
		@excercises = @user.excercises
		@event = Event.new
		@excercise = Excercise.find(params[:id])
	end

	def create
	end

	def index
		@user = User.find(current_user.id)
		excercise = Excercise.new
		@event = Event.new
	end

	def new
		excercise = Excercise.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
