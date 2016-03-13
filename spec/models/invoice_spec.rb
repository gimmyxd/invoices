require 'spec_helper'

describe Invoice, type: :model do
  before { @invoice = FactoryGirl.build(:invoice) }

  subject { @invoice }

  it { is_expected.to belong_to(:company) }
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to accept_nested_attributes_for(:items) }
  
end