class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(current_user.id)
    @user_id = User.find(params[:id])
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

  private
  def correct_user
     user = User.find(params[:id])
     if current_user != user
       redirect_to user_path(current_user.id)
     end
  end

end
