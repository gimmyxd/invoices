class Company < ActiveRecord::Base
  has_many :invoices
  # Customer association
  has_many :customer_invoices, foreign_key: "customer_id", class_name: "Invoice"

  validates :name, presence: true
end
