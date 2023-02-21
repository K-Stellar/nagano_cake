class Address < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :customer_id }
  validates :postal_code, presence: true, length: { is: 7 }
  
   enum address_option: { "current_address": 0, "other_address": 1, "new_address": 2 }

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
