class BooksController < ApplicationController
	before_action :authenticate_user!
	def index
		@book=Book.all
	end
	def create
		@book=Book.new(book_params)
		@book.user_id=current_user.id
	end
	def show
		
	end
	def edit
		
	end
end
