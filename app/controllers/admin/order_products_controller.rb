class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    order=Order.find(params[:id])
    order_product_i=order.product_id
    order_product=OrderProduct.find(order_product_i)
    order_product.update
  end
end
