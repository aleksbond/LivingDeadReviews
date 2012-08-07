# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    product_id 1
    user_id 1
    rating 1
    comment "Awesome Axe!"
    user_email "zombie@reviews.com"
    status "active"
  end
end
