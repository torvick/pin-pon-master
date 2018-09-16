class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :delete_all
  has_many :ratings, dependent: :delete_all

  validates :alias, uniqueness: true
end
