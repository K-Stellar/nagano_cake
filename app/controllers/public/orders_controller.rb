class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def check
   @order = Order.new(order_params)
   if params[:order][:address_option] == "0"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.last_name + current_customer.first_name

   elsif params[:order][:address_option] == "1"
     @address = Address.find(params[:order]["address_id"])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name

   elsif params[:order][:address_option] == "2"
     @order.postal_code = params[:order]["postal_code"]
     @order.address = params[:order]["address"]
     @order.name = params[:order]["name"]
   end

   @cart_items = current_customer.cart_items.all
   @total_price = @cart_items.inject(0) { |sum, product| sum + product.subtotal }
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800.to_i
    @order.total_payment = @total_price.to_i

    @order.save

    current_customer.cart_items.each do |cart_item|
        @order_product = OrderProduct.new
        @order_product.order_id = @order.id
        @order_product.product_id = cart_item.product_id
        @order_product.amount = cart_item.amount
        @order_product.price = cart_item.product.add_tax_price
        @order_product.save
    end

    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
    # @total_price = order.order_products.inject(0) { |sum, product| sum + product.subtotal }
  end

  def show
  end




  private
    def order_params
      params.require(:order).permit(:payment_type, :postal_code, :address, :name)
    end

end
