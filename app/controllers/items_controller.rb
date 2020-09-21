class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :search_item, only: [:search, :search_result]
  
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @items = Item.all
    set_item_column
  end

  def search_result
    @results = @p.result#.includes(:image, :cateogry_id, :condition_id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item)
          .permit(:name, :image, :explanation, :price, :category_id, :condition_id, :origin_area_id, :shipping_charge_id, :send_day_id)
          .merge(user_id: current_user.id)
  end

  def search_item
    @p = Item.ransack(params[:q]) 
  end
  
  def set_item_column
    @item_name = Item.select("name").distinct
    #@item_condition = Condition.select("name")
    #@item_category = Category.select("name")
    
  end
end
