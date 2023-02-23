class Public::HomesController < ApplicationController
  def top
    @products=Product.order('id DESC').limit(4)
    @genres = Genre.all
  end

  def about
  end
end
