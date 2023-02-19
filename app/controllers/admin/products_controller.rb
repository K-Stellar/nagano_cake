class Admin::ProductsController < ApplicationController
  def index
    @products=Product.page(params[:page]).per(10)
  end

  def new
    @product=Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
  end

  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      render 'index'
    end
  end

  def update
    @product=Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render 'index'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :information, :image, :genre_id, :price, :is_active)
  end
end
