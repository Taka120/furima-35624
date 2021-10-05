class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_number, :prefecture_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end