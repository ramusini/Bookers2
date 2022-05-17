class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @new_book = Book.new
    @books = Book.all
  end

  def create
    @new_book = Book.new(book_params) #下でbook_paramsのストロングパラメータメソッドを作成しないと機能しない。
    @new_book.user_id = current_user.id #ここが不在の場合、bookモデルのuser_idが不在になり、saveできない。
    if @new_book.save
      redirect_to book_path(@new_book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
