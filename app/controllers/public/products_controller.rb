class Public::ProductsController < ApplicationController
  def index
    @products=Product.all
    @products_page=Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = current_customer.cart_items.new
  end


  private

  def product_params
    params.require(:product).permit(:name, :information, :image, :genre_id, :price, :is_active)
  end

end
