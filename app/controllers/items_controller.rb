class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end    
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :condition_id, :origin_area_id, :shipping_charges_id, :send_day_id).merge(user_id: current_user.id)
  end
end