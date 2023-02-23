class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    # order=Order.find(params[:id])
    @order_product=OrderProduct.find(params[:id])
    # byebug
    @order_product.update(order_product_params)
    redirect_to request.referer
  end
  
  def order_product_params
    params.require(:order_product).permit(:makig_status)
  end
end
