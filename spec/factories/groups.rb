FactoryBot.define do
  factory :group do
    number { rand(1..99) }
    letter { Faker::Alphanumeric.alpha(number: 1) }
  end
end
