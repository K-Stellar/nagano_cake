class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product=Product.new
    @products=Product.all
  end

  def show
  end

  def edit
  end
  
  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to new_admin_product_path #商品詳細ページのパスへ変更予定
    else
      render ''
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:name, :information, :image, :genre_id, :price, :is_active)
  end
end
