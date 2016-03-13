class Company < ActiveRecord::Base
  has_many :invoices, dependent: :destroy
  # Customer association
  has_many :customer_invoices, foreign_key: 'customer_id', class_name: 'Invoice', dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def to_receive
    @total = 0
    self.invoices.each do |invoice|
      @total += invoice.total
    end
    @total
  end

  def to_pay
    @total = 0
    self.customer_invoices.each do |invoice|
      @total += invoice.total
    end
    @total
  end
end
