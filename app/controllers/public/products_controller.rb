class Public::ProductsController < ApplicationController
  def index
  end

  def show
    # @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :information, :price, :image)
  end

end
