class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		book = Book.new
	end

	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
	end

	def index
		@book = Book.all
	end

	def create
			book = Book.new(book_params)
			@books = Book.all
			book.user_id = current_user.id
			if book.save
				redirect_to book_path(book.id)
			else
				render :index
			end
	end

	def edit
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
