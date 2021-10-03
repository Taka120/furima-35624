class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id, :delivery_fee_id, :area_id, :days_to_ship_id, :item_price, :image).merge(user_id: current_user.id)
  end
end
