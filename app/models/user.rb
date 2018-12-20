class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter, :facebook, :google_oauth2]

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :birth_year, :birth_month, :birth_day, presence: true

  has_one  :address

  has_many :products

  accepts_nested_attributes_for :address, update_only: true

  has_one :credit

  protected
  def self.find_oauth(auth)
    snscredential = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
          )
        user_id = user.id
        SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user_id
          )
      end
      user
    end
  end
end
