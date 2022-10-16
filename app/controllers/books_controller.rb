class BooksController < ApplicationController
  include Booknew
  before_action :book_new

  def index
    @user = User.find(current_user.id)
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
    book = Book.find_by(id: params[:id])
    @user = User.find_by(id: book.user_id)
    @book_detail = Book.find(params[:id])
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