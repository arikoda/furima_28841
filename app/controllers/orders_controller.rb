class OrdersController < ApplicationController
  before_action :move_to_log_in, ecxept: [:index]
  before_action :set_order, ecxept: [:index, :create]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :origin_area_id, :prefecture, :home_number, :building_number, :telephone ).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id, order_id: params[:order_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_log_in
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
