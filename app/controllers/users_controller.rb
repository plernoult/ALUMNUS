class UsersController < ApplicationController
  def index
    @current_city = current_user.current_city
    @prox_users = User.near(@current_city, 10).where.not(id: current_user)
  end


  def show
    @user = User.find(params[:id])
    @chatroom = Chatroom.joins(:messages).joins(:users).where("users.id = ? OR users.id = ?", @user, current_user).uniq
  end

  def search
    if params[:query].present?
      sql_query = "first_name ILIKE :query \
       OR last_name ILIKE :query \
       OR concat(first_name,' ',last_name) ILIKE :query \
       OR concat(last_name,' ',first_name) ILIKE :query \
       OR concat(first_name,last_name) ILIKE :query \
       OR concat(last_name,first_name) ILIKE :query \
       OR current_city ILIKE :query \
       OR occupation ILIKE :query \
       OR company_name ILIKE :query \
       OR batch_number = :query_int"

        @users = User.where(sql_query, query: "%#{params[:query]}%", query_int: params[:query].to_i)


    else
      @users = User.where.not(id: current_user.id)
    end
  end


private

  def user_params
    params.require(:user).permit(:photo, :favorite, :bio)
  end

end
