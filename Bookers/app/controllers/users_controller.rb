class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		# @book = Book.find(params[:id])
		@books = @user.books.page(params[:page]).reverse_order  # ここを記述

	end

	def index
		@user = User.find(current_user.id)
		@users = User.all
		@book_new = Book.new
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
		if @user.update(user_params)
			flash[:notice]='successfully'
			redirect_to user_path(@user.id)
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
