class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @chatroom = Chatroom.joins(:messages).joins(:users).where("users.id = ? OR users.id = ?", @user, current_user).uniq
  end

  def user_params
  params.require(:user).permit(:photo)
  end

end
