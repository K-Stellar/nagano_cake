class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    # @cart_items = CartItem.all
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]).present?
      cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path(@cart_item.id)
    elsif
      @cart_item.save
      redirect_to cart_items_path(@cart_item.id)
    else
      redirect_to request.referer
    end
  end
  
  
  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :amount)
  end

end
