module Booknew
extend ActiveSupport::Concern

  def book_new
    @book = Book.new
  end

end