class Order < ApplicationRecord

  belongs_to :customer, dependent: :destroy
  has_many :order_products
  has_many :products, through: :order_products

  scope :latest, -> {order(created_at: :desc)}
  enum payment_type: { credit_card: 0, transfer: 1 }


  enum status: {
     "入金待ち":0,
     "入金確認":1,
     "製作中":2,
     "発送準備中":3,
     "発送済み":4
  }

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true


end
