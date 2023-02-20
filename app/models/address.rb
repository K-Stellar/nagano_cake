class Address < ApplicationRecord
  belongs_to :customer

  enum address_option: { current_address: 0, other_address: 1, new_address: 2 }

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
