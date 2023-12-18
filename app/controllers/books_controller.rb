class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    # createアクションの実装（本の保存など）

    redirect_to user_books_path(current_user)
  end

  def show
    @book = Book.find(params[:id])
  end
end