class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_one_attached :photo
  validates :photo, presence: true
  has_many :messages
  has_many :chatrooms, through: :messages, dependent: :destroy
  geocoded_by :current_sign_in_ip, latitude: :latitude, longitude: :longitude
  after_save :geocode #, if: :will_save_change_to_current_city?
  has_many :favorites, dependent: :destroy
end
