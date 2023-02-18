class Public::ProductsController < ApplicationController
  def index
    @products=Product.page(params[:page])
  end

  def show
  end


  private

  def product_params
    params.require(:product).permit(:name, :information, :image, :genre_id, :price, :is_active)
  end

end
