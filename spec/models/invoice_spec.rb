require 'spec_helper'

describe Invoice, type: :model do
  before { @invoice = FactoryGirl.build(:invoice) }

  subject { @invoice }

  it { is_expected.to belong_to(:company) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:items) }
  it { is_expected.to validate_presence_of(:company) }
  it { is_expected.to validate_presence_of(:customer) }

  describe 'total' do
    it 'calculates total value of an invoice' do
      invoice = FactoryGirl.create :invoice
      item1 = FactoryGirl.create :item, invoice_id: invoice.id, price: 2.5, quantity: 10
      item2 = FactoryGirl.create :item, invoice_id: invoice.id, price: 2, quantity: 3
      expect(invoice.total).to eql 31.0
    end
  end
end
