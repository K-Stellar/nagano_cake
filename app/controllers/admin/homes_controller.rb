class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
   @orders = Order.page(params[:page]).per(10)
   @order_product.amount = @order.order_product.amount
  end
end
