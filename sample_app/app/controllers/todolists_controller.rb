class TodolistsController < ApplicationController
  def new
  	# Viewへ渡すためのインスタンス変数にからのモデルオブジェクトを生成
  		@list=List.new
  end

  # 追加
  def create
  		list=List.new(list_params)
  		# bdへ保存する
  		list.save
  		# トップ画面へリダイレクト
  		redirect_to todolist_path(list.id)
  end

  def index
  		@lists=List.all
  end

 	def show
 			@list=List.find(params[:id])
 	end

  def edit
      @list=List.find(params[:id])
  end

  def update
      list=List.find(params[:id])
        list.update(list_params)
        redirect_to todolist_path(list.id)
  end
  def destroy
      list=List.find(params[:id])
      list.destroy #データ(レコードを削除)
      redirect_to todolists_path #List一覧画面へリダイレクト
  end

  private
  def list_params
  		params.require(:list).permit(:title, :body, :image)
  end

end