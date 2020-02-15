class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		book = Book.new
	end

	def show
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = User.find(current_user.id)
	end

	def index
		@user = User.find(current_user.id)
		@book_new = Book.new
		@books = Book.all
	end

	def create
			book = Book.new(book_params)
			@books = Book.all
			book.user_id = current_user.id
			if book.save
				flash[:notice]='successfully'
				redirect_to book_path(book.id)
			else
				render :index
			end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice]='successfully'
			redirect_to book_path(@book.id)
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
