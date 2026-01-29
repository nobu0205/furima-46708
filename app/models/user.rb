class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX =  /\A[ぁ-んァ-ン一-龥]+\z/
  validates :username, presence: true
  validates :first_name, :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }

  VALID_KANA_REGEX =  /\A[ァ-ヶー]+\z/
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX =  /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は英字と数字の両方を含めてください" }, if: -> { password.present? }

end
