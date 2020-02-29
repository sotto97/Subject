class ExcercisesController < ApplicationController
	before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

	def new
		excercise = Excercise.new
	end

	def show
		@excercise_new = Excercise.new
		@excercise = Excercise.find(params[:id])
		@excercises = Excercise.all
		@user = User.find(current_user.id)
		@event = Event.new
	end

	def index
		@excercise_new = Excercise.new
		@user = User.find(current_user.id)
		@event = Event.new
		@excercises = Excercise.all
	end

	def create
		@user = User.find(current_user.id)
		@excercise_new = Excercise.new(excercise_params)
		@excercises = Excercise.all
		@excercise_new.user_id = current_user.id
		if @excercise_new.save
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def edit
		@excercise = Excercise.find(params[:id])
	end

	def destroy
		@excercise = Excercise.find(params[:id])
		@excercise.destroy
		redirect_to user_path
	end

	def ensure_correct_user
		if current_user.id = params[:id].to_i
		redirect_to user_path
		end
	end

	private
	def excercise_params
		params.require(:excercise).permit(:target, :excercise_name, :reps, :sets)
	end

end
