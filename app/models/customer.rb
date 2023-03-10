class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 退会処理用
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def full_name
    self.last_name + self.first_name
  end

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders

  def self.looks(word)
    @customers = Customer.where(["last_name LIKE? OR first_name LIKE?","%#{word}%", "%#{word}%"])
  end

end
