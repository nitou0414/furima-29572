class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :image
  end
  validates :name, presence:true, length:{maximum:40}
  validates :explanation, presence:true, length:{maximum:1000}
  validates :price, presence:true, numericality: {greater_than_or_equal_to: 300} ,numericality: {less_than:10000000}
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, presence: true, format: { with: VALID_PRICE_REGEX }


  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_date
  has_one_attached :image
  belongs_to :user
  has_one :item_purchase
end