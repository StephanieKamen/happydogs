class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true

  # validates :name, presence: true

  validates :email, presence: true

  has_many :bookings, dependent: :destroy
  has_many :doghomes, dependent: :destroy
  # has_many :bookings, through: :doghomes
end
