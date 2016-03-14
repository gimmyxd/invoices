require 'spec_helper'

describe Company, type: :model do
  before { @company = FactoryGirl.build(:company) }

  subject { @company }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many(:invoices).dependent(:destroy) }
  it { is_expected.to have_many(:customer_invoices).dependent(:destroy) }

  describe '.calculate_value' do
    it 'calculates total value of a company invoices' do
      company = FactoryGirl.create :company
      invoice = FactoryGirl.create :invoice, company_id: company.id
      item1 = FactoryGirl.create :item, invoice_id: invoice.id, price: 2.5, quantity: 10
      item2 = FactoryGirl.create :item, invoice_id: invoice.id, price: 2, quantity: 3
      expect(company.calculate_value(company.invoices)).to eql 31.0
    end
  end
end
