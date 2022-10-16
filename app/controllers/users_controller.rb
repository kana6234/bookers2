class UsersController < ApplicationController
  include Booknew
  before_action :book_new

  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
  end

  def edit
  end
end
