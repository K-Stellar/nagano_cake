class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_products

  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def add_tax_price
    (price*1.1).floor
  end

end
