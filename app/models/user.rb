class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :name
    validates :family_name
    validates :first_name
    VALID_NAME_REGIX = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format:{with: VALID_NAME_REGIX}
    validates :first_name, format:{with: VALID_NAME_REGIX}
    validates :family_name_kana
    validates :first_name_kana
    VALID_KANA_REGIX = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana, format:{with:VALID_KANA_REGIX}
    validates :first_name_kana, format:{with:VALID_KANA_REGIX}
    validates :birth_day
  end
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGIX ,message:  "is invalid"}  
end
