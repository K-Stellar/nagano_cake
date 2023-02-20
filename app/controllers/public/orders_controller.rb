class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end

  def check
  end

  def complete
  end

  def index
  end

  def show
  end
  
  
  
  
  private
    def order_params
      params.require(:order).permit(:payment_method)
    end
    
end
