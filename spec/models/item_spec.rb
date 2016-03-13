require 'spec_helper'

describe Item, type: :model do
  before { @item = FactoryGirl.build(:item) }

  subject { @item }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:price) }
  it { is_expected.to respond_to(:quantity) }
  it { is_expected.to validate_numericality_of(:price) }
  it { is_expected.to validate_numericality_of(:quantity) }
  it { is_expected.to belong_to(:invoice) }

  it 'validates that quantity is is integer' do
    item = FactoryGirl.build :item, quantity: 12.3
    expect(item).to_not be_valid
  end

end