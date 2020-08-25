class AddFavoriteUserToFavorite < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :favorite_user_id, :integer
  end
end
