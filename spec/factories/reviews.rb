# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    product_id 1
    user_id 1
    rating 1
    comment "MyText"
    user_email "MyString"
    status "MyString"
  end
end
