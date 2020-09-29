class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def create
    @book = Book.new(book_params)
    @user = User.find(current_user.id)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(current_user.id)
  else
    @books = Book.all
    render action: :index
  end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(current_user.id)
    else
    render edit_book_path
    end 
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end 

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
