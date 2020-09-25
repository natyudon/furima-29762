class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :products
  has_many :orders
  has_one :card, dependent: :destroy
  has_many :sns_credentials

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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
     name: auth.info.name,
       email: auth.info.email
   )
   if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
  end
end
