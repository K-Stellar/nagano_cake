class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
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
      flash[:danger]="入力内容に不備があります。<br>・#{@product.errors.full_messages.join('<br>・')}"
      redirect_to new_admin_product_path
    end
  end

  def update
    @product=Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      flash[:danger]="入力内容に不備があります。<br>・#{@product.errors.full_messages.join('<br>・')}"
      redirect_to edit_admin_product_path(@product.id)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :information, :image, :genre_id, :price, :is_active)
  end
end
