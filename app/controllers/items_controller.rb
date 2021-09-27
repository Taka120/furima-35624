class ItemsController < ApplicationController
  def new
    
  end

  def create
  end

  private
  
  def item_params
    params.require(:item).permit(:image)
  end
end
