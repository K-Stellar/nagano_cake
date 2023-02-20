class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def check

   @order = Order.new(order_params)
   if params[:order]["address_option"] == "0"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name

   elsif params[:order]["address_option"] == "1"
     @address = Address.find(params[:order]["address_id"])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name

   else
     @order.postal_code = params[:order]["postal_code"]
     @order.address = params[:order]["address"]
     @order.name = params[:order]["name"]
   end

   @cart_items = current_customer.cart_items.all
   @total_price = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def complete
  end

  def index
  end

  def show
  end




  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end

end
