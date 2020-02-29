class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]


	def show
		@user = User.find(params[:id])
		@excercise_new = Excercise.new
		@excercises = @user.excercises.all
		@event = Event.new
		# @user.excercise = Excercise.find(params[:id])
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

	def ensure_correct_user
		if current_user.id = params[:id].to_i
		redirect_to user_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
