FactoryGirl.define do
  factory :item do |f|
    f.association :invoice
    f.name { Faker::Lorem.word }
    f.description Faker::Lorem.sentence
    f.price Faker::Number.decimal(2)
    f.quantity Faker::Number.number(2)
  end
end
