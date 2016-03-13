class Invoice < ActiveRecord::Base
  belongs_to :company
  has_many :items, dependent: :destroy
  # Customer association
  belongs_to :customer, class_name: 'Company'
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  def total
    items.inject(0) { |sum, item| sum += item.total_price }
  end
end
