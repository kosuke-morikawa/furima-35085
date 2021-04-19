class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products
  has_many :orders

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true
  with_options presence: true do
    # 英数字混合にする
    validates :password,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Inputhalf-width sharacters."}
    # 全角（漢字・ひらがな・カタカナ）での入力にする
    validates :nickname, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # ユーザーのフリガナは全角のカタカナにする。（苗字）
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/}
    # ユーザーのフリガナは全角のカタカナにする。（姓名）
    validates :last_name_kana, format: {with: /\A[ァ-ヶー]+\z/}
    # ユーザー名の
    validates :last_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
  end
end
