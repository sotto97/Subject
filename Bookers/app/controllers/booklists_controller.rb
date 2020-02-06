class BooklistsController < ApplicationController
  def new
      @list=List.new
  end

  def index
      @lists=List.all
      @list=List.new
  end

  def create
      @list=List.new(list_params)
      @lists=List.all
      if @list.save
        flash[:notice]='Successfully'
        redirect_to booklist_path(@list)
      else
        render :index
      end
  end

  def show
      @list=List.find(params[:id])
  end

  def edit
      @list=List.find(params[:id])
  end

  def destroy
      @list=List.find(params[:id])
      @list.destroy
      redirect_to booklists_path
  end

  def update
      @list=List.find(params[:id])
      @list.update(list_params)
      redirect_to booklist_path(@list)
  end

  private
  def list_params
      params.require(:list).permit(:title, :body)
  end

end