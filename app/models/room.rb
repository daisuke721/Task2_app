class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  mount_uploader :image, RoomImageUploader

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
