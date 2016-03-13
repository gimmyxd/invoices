class Company < ActiveRecord::Base
  has_many :invoices, dependent: :destroy
  # Customer association
  has_many :customer_invoices, foreign_key: 'customer_id', class_name: 'Invoice', dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def calculate_value(invoices)
    invoices.inject(0) { |sum, invoice| sum += invoice.total }
  end
end
