class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :origin_area
  belongs_to_active_hash :send_day
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price,numericality: { only_integer: true, greater_than: 299, less_than: 9_999_999 },format: { with: /\A\d+\z/ }
    validates :category_id, :condition_id, :origin_area_id, :shipping_charge_id, :send_day_id,numericality: { other_than: 1 }
    validates :user
  end
end
