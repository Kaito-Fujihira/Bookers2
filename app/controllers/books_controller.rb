class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render("/books/index")
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
