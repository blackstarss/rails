class TodolistsController < ApplicationController
  def new
     @list = List.new# Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  
  end
  
  def create
    # １. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
 
    redirect_to '/top'   # ３. データベースへ保存した後、トップ画面（top）へリダイレクトするようにしています。
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
