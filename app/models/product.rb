class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_many_attached :images
  has_one :order

  validates :name, :content, :category, :state, :images, :delivery_fee, :area, :delivery_day, presence: true
  validates :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_day_id, numericality: { other_than: 1, message: 'Select'}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
end
