FactoryGirl.define do
  factory :company do |f|
    f.name { Faker::Company.name }
  end
end
