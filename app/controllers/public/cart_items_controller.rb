class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    # @cart_item.customer_id == current_customer.id
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :price, :amount)
  end
  
end
