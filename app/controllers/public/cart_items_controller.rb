class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.create(cart_item_params)
    redirect_to cart_items_path
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :price, :acount)
  end
  
end
