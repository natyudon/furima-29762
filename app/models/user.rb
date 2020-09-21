class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders
  has_one :card, dependent: :destroy

  PASSWORD_FULL_WIDTH = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  PASSWORD_FULL_WIDTH_KANA = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :name
    validates :last_name, format: {with: PASSWORD_FULL_WIDTH, message: 'は全角で入力してください。'}
    validates :first_name, format: {with: PASSWORD_FULL_WIDTH, message: 'は全角で入力してください。'}
    validates :last_name_kana, format: { with: PASSWORD_FULL_WIDTH_KANA, message: 'は全角カタカナで入力して下さい。'}
    validates :first_name_kana, format: { with: PASSWORD_FULL_WIDTH_KANA, message: 'は全角カタカナで入力して下さい。'}
    validates :birth_date
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
