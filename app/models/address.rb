class Address < ApplicationRecord
  belongs_to :customer
  
  validates :address, uniqueness: true
end
