class Item < ActiveRecord::Base
  belongs_to :invoice

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }

  def total_price
    self.price * self.quantity
  end
end
