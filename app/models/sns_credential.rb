class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  validates :provider, presence: true
  validates :uid, presence: true
  #それぞれのカラムにnull: falseは指定していないけどテーブルに保存される時は両方の値が必要なためpresence: trueを指定
end
