class UsersController < ApplicationController
  def index
    @current_city = current_user.current_city
    @prox_users = User.near(@current_city , 10)

    if @prox_users.length == 1
      @users = User.all
    else
      @users = @prox_users
    end

    if params[:query].present?
      sql_query = "first_name ILIKE :query \
       OR last_name ILIKE :query \
       OR concat(first_name,' ',last_name) ILIKE :query \
       OR concat(last_name,' ',first_name) ILIKE :query \
       OR concat(first_name,last_name) ILIKE :query \
       OR concat(last_name,first_name) ILIKE :query \
       OR current_city ILIKE :query \
       OR occupation ILIKE :query"

      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end

  end

  def show
    @user = User.find(params[:id])
    @chatroom = Chatroom.joins(:messages).joins(:users).where("users.id = ? OR users.id = ?", @user, current_user).uniq
  end

  def user_params
  params.require(:user).permit(:photo)
  end

end
