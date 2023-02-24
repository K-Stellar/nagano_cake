class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    if admin_signed_in?
      if @range == "Product"
        @products = Product.looks(params[:word]).page(params[:page]).per(10)
      else
        @customers = Customer.looks(params[:word]).page(params[:page]).per(10)
      end
    end
  end
end
