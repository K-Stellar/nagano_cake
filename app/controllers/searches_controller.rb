class SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search
    @products = Product.looks(params[:word])
  end
end
