class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @books = Book.all
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
  if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path
  else
    render :edit
  end
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
