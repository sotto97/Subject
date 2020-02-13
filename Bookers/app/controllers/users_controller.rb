class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		@book = Book.find(params[:id])
		# @bookse = Book.all
		@books = @user.books.page(params[:page]).reverse_order  # ここを記述

	end

	def index
		@user = User.find(params[:id])
		@book_new = Book.new
		@users = User.all
	end

	def new
	end

  def create
  end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	private
	def user_params
		params.require(:user).permit(:username, :introduction, :profile_image)
	end
end
