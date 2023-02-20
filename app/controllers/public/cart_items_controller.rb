class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id]) #追加した商品と同じ商品
    if @cart_item.amount.blank?
      redirect_to request.referer
    elsif cart_item.present?  #同じ商品がカート内にある場合
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path(@cart_item.id)
    else
      @cart_item.save
      redirect_to cart_items_path(@cart_item.id)
    end
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      redirect_to products_path
    end
  end
  
  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :amount)
  end

end
