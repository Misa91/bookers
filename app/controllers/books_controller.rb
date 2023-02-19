class BooksController < ApplicationController
  def new #投稿フォームを表示するアクション
    @book = Book.new
  end

  def create
    book = Book.new(book_params)  # データを受け取り新規登録するためのローカル変数作成
    if book.save # データをDBに保存するためsaveメソッド
      redirect_to book_path(book.id) # 詳細画面へリダイレクト
    else
      render :new #新規投稿ページを再表示
    end
  end

  def index
    @books = Book.all #Bookリストのデータを全て取得
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 一覧画面へリダイレクト  
  end

  private #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
