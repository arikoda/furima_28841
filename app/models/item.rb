class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :origin_area
  belongs_to_active_hash :send_day
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than: 299, less_than: 9_999_999 },
                    format: { with: /\A\d+\z/ }
  validates :category_id, :condition_id, :origin_area_id, :shipping_charges_id, :send_day_id,
            presence: true, numericality: { other_than: 1 }
  validates :user, presence: true
end
