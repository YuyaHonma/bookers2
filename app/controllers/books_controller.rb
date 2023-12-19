class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id

  if @book.save
    redirect_to user_book_path(current_user, @book)
  else
    render :new
  end
end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
  @book = Book.find(params[:id])

  if @book.update(book_params)
  redirect_to user_books_path(current_user), notice: 'You have updated book successfully.'
else
  render :edit
end
end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end