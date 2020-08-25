class UsersController < ApplicationController
  def index
    @current_city = current_user.current_city
    @prox_users = User.near(@current_city , 10)

    if @prox_users.length == 1
      @users = User.all
    else
      @users = @prox_users
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
  params.require(:user).permit(:photo)
  end

end
