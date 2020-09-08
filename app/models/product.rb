class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :state, :delivery_fee, :area, :delivery_day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :content, length: {maximum: 1000}
    validates :price, numericality: { 
      greater_than_or_equal_to: 300, 
      less_than_or_equal_to: 9999999, 
      message: "is out of setting range"
    },
      format: { with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :delivery_day_id
    validates :image
  end
  with_options numericality: { other_than: 1} do
  validates :category_id
  validates :state_id
  validates :delivery_fee_id
  validates :area_id
  validates :delivery_day_id
  end
end
