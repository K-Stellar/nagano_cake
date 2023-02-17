class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
