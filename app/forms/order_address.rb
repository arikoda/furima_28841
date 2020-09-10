class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :origin_area_id, :home_number, :building_number, :telephone, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :telephone, length: { maximum: 11 }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ , message: "is nvalid, Include hyphen(-)" }
    validates :home_number
    validates :prefecture
  end

  validates :origin_area_id, numericality: { other_than: 1, message: "can't be blank" }
  
  def save
    #user = User.find(order_params[:user_id])
    #item = Item.find(params[:item_id])
    Address.create(postal_code: postal_code, prefecture: prefecture, origin_area_id: origin_area_id, home_number: home_number, building_number: building_number, telephone: telephone )
    Order.create(user_id: user_id, item_id: item_id)
  end
end