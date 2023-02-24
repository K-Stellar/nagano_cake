class SearchesController < ApplicationController

  def search
    @products = Product.looks(params[:word]).page(params[:page])
    @genres = Genre.all
  end
end
