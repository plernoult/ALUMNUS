class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user: current_user )
  end

  def create
    @user = User.find(params[:user_id])
    @favorite = Favorite.where(favorite_user: @user, user: current_user).first
    if @favorite.nil?
      @favorite = Favorite.new(favorite_user: @user)
      @favorite.user = current_user
    
      if @favorite.save
        current_user.favorites << @favorite
        redirect_to user_path(@user)
      else
        render 'users/show'
      end
    else 
      redirect_to user_path(@user)
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @favorite = current_user.favorites.find_by(favorite_user: @user)
    @favorite.destroy
    redirect_to user_path(@user)
  end


end
