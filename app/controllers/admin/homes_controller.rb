class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
   @order_product.amount = @order.order_product.amount
  end
end
