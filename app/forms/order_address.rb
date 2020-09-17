class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :origin_area_id, :home_number, :building_number, :telephone, :item_id, :user_id, :token, :order_id

  with_options presence: true do
    validates :telephone, length: { minimum: 10, maximum: 11 }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'が正しくありません。ハイフン（−）を入れてください' }
    validates :home_number
    validates :prefecture
    validates :token
  end

  validates :origin_area_id, numericality: { other_than: 1, message: "が選択されていません" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, origin_area_id: origin_area_id, home_number: home_number, building_number: building_number, telephone: telephone, order_id: order.id)
  end
end
