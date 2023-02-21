class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
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
