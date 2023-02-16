class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  belongs_to :genre
  has_one_attached :image
  validates :name, presence: true
  validates :information, presence: true
  validates :price, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end
end
