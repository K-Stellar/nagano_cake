class Address < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :customer_id }
  validates :postal_code, presence: true, length: { is: 7 }
end
