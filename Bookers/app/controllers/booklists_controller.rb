class BooklistsController < ApplicationController
  def new
      @list=List.new
  end

  def index
      @lists=List.all
  end

  def create
      list=List.new(list_params)
      list.save
      redirect_to booklists_path
  end

  def show
      @list=List.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private
  def list_params
      params.require(:list).permit(:title, :body)
  end

end
