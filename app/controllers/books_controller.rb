class BooksController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def show
    book = Book.find_by(id: params[:id])
    @user = User.find_by(id: book.user_id)
    @book_detail = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end