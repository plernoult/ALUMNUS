class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_one_attached :photo
  validates :photo, presence: true
  has_many :messages
  has_many :chatrooms, through: :messages, dependent: :destroy
  geocoded_by :ip_address, latitude: :latitude, longitude: :longitude
  after_validation :geocode
  has_many :favorites, dependent: :destroy

  def ip_address
    # "185.25.194.10"
    current_sign_in_ip.to_s
  end
end
