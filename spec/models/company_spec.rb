require 'spec_helper'

describe Company, type: :model do
  before { @company = FactoryGirl.build(:company) }

  subject { @company }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_many(:invoices).dependent(:destroy) }
  it { is_expected.to have_many(:customer_invoices).dependent(:destroy) }
end