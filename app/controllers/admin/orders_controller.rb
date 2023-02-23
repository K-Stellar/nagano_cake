class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order=Order.find(params[:id])
    @orders=Order.all
    @order_products=OrderProduct.all
  end
  
  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
