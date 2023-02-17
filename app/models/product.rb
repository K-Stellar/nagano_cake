class Product < ApplicationRecord
  has_one_attached :image
  
  validates :name, presence: true, uniqueness: true
  validates :information, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  
  def get_image
    (image.attachd?) ? image : 'no_image.jpg'
  end

end
