class Company < ActiveRecord::Base
  has_many :invoices
  # Replacement association
  has_many :customer_invoices, foreign_key: "customer_id", class_name: "Invoice"
end
