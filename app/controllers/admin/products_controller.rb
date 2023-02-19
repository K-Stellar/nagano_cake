class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product=Product.new
    @products=Product.all #確認用　後程削除
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product=Product.find(params[:id])
    @products=Product.all #確認用　後程削除
  end

  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to new_admin_product_path
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
