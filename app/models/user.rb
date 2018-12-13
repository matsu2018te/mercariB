class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i
  validates :encrypted_password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :telephone, presence: true, format: { with: VALID_PHONE_REGEX }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/



end
