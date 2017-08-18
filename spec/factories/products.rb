FactoryGirl.define do
  factory :product do
    # title "MyString"
    title { Faker::Name.name }
    description "MyText"
    price "9.99"

    trait :cheap do
      price 1
    end
  end
end

# p1 = FactoryGirl.create(:product)
