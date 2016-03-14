class Item < ActiveRecord::Base
  belongs_to :invoice

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }
  validates_presence_of :invoice

  def total_price
    self.price * self.quantity
  end
end
