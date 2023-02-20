class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer


  def subtotal
    product.add_tax_price * amount
  end

end
