class Public::ProductsController < ApplicationController
  def index
    @products=Product.all
    @products_page=Product.page(params[:page])
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    if customer_signed_in?
      @cart_item = current_customer.cart_items.new
    end
    @genres = Genre.all
  end


  private

  def product_params
    params.require(:product).permit(:name, :information, :image, :genre_id, :price, :is_active)
  end

end
