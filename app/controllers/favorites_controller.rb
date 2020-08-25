class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user: current_user )
  end

  def create
    @current_user = current_user
    @user = User.find(params[:user_id])
    @favorite = Favorite.new(favorite_user: @user)
    @favorite.user = @current_user
   
    if @favorite.save
      @current_user.favorites << @favorite
      redirect_to user_favorites_path
    else
      render 'users/show'
    end
  end
end
