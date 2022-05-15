class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params) #下でbook_paramsのストロングパラメータメソッドを作成しないと機能しない。
    @book.user_id = current_user.id #ここが不在の場合、bookモデルのuser_idが不在になり、saveできない。
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    #@book = Book.newを指定したい。でないとこの画面でsubmitがpatchになる。
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title,:body)
  end
end
