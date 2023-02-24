class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order=Order.find(params[:id])
    @order_products=OrderProduct.where(order_id: @order.id)
  end
  
  def update
    @order=Order.find(params[:id])
    @order_products=OrderProduct.where(order_id: @order.id)
    if @order.update(order_params)
      @order_products.update_all(makig_status: 1) if @order.status == "入金確認"
    end
    redirect_to request.referer
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
