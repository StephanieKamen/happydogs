class Doghome < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :description, :location, :price_per_day, presence: true
  has_one_attached :photo
end
