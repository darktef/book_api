FactoryBot.define do
  factory :stock do
    book
    shop
    copies { rand(100) }
  end
end