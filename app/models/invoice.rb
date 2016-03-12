class Invoice < ActiveRecord::Base
  belongs_to :company
  has_many :items
  # Customer association
  belongs_to :customer, class_name: "Company"
end
