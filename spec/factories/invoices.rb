FactoryGirl.define do
  factory :invoice do |f|
    f.association :company
    f.association :customer, factory: :company
  end
end
