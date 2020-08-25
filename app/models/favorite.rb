class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_user, class_name: "User"
end
