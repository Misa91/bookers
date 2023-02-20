class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)  # データを受け取り新規登録するためのインスタンス変数作成
    if @book.save # データをDBに保存するためsaveメソッド
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id) # indexアクションを経由して詳細画面へリダイレクト
    else
      @books = Book.all # このままだと@booksが空の状態で画面遷移しようとするのでcreateでも定義
      render :index # indexアクションを経由せず新規投稿ページを再表示
    end
  end

  def index
    @book = Book.new # 入力されたデータを@bookに追加
    @books = Book.all # Bookリストのデータを全て取得
  end

  def show
    @book = Book.find(params[:id]) # データ(レコード)を1件取得
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save # データをDBに保存するためsaveメソッド
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id) # 詳細画面へリダイレクト
    else
      render :edit # 新規編集ページを再表示
    end
  end

  def destroy
    book = Book.find(params[:id]) # 新たに画面に表示させないのでローカル変数でよい
    book.destroy  # データ(レコード)を削除
    redirect_to '/books'  # 一覧画面へリダイレクト
  end

  private #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
