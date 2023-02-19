class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path(@cart_item.id)
    else
      redirect_to request.referer
    end
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :price, :amount)
  end
  
end
