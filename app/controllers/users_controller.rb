class UsersController < ApplicationController
  include Booknew
  before_action :book_new

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
