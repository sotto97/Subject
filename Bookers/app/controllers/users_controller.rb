class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@book_new = Book.new
		@book = Book.find(params[:id])
		@books = Book.all
	end

	def new
	end

  def create
  end

	def edit
	end

	private
	def user_params
	end
end
