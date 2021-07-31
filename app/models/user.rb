class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true

  has_many :doghomes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :bookings, through: :doghomes
end
