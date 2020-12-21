class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGIX }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_day, presence: true
end
