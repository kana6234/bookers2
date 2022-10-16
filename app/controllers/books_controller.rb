class BooksController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end