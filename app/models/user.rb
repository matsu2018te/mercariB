class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :birth_year, :birth_month, :birth_day, presence: true

  has_one  :address
<<<<<<< HEAD

  has_many :products

  accepts_nested_attributes_for :address, update_only: true

=======
  accepts_nested_attributes_for :address, update_only: true
>>>>>>> master
end
