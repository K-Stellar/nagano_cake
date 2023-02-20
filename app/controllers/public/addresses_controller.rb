class Public::AddressesController < ApplicationController
  def index
  end

  def edit
    @address=Address.find(params[:id])
  end
  
  def update
    product=Product.find(params[:id])
    product.update(product_params)
    redirect_to 
  end
end
