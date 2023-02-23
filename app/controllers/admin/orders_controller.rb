class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order=Order.find(params[:id])
    @orders=Order.all
    @order_products=OrderProduct.all
  end
  
  def update
    order=order.find(params[:id])
    order.update(order_paramas)
    redirect_to request.referer
  end
  
  private
  
  def order_paramas
    paramas.require(:order).permit(:status)
  end
end
