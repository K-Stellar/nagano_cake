class Public::HomesController < ApplicationController
  def top
    @products=Product.order('id DESC').limit(4)
  end

  def about
  end
end
