class ListsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成
    @list = List.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    #詳細画面へリダイレクト
      redirect_to list_path(@list.id)
    else
     render :new
    end
  end

  def index
    #indexアクションは一覧画面用のアクションとして定義
    #一覧画面には投稿したList全てを表示させるので、全てのデータを取得する記述
    @lists =List.all
  end

  def show
    #レコードを1件だけ取得するので、インスタンス変数名は単数形の@list
    @list = List.find(params[:id])
  end

  def edit
    #投稿済みのデータを編集するので、保存されているデータが必要
    #findメソッドを用いて、データを取得
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ(レコード)を1件取得
    list.destroy #データ(レコード)を削除
    redirect_to '/lists'  #投稿一覧画面へリダイレクト
  end


private
#ストロングパラメータ
  def list_params
   params.require(:list).permit(:title, :body, :image)

  end
end