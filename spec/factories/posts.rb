# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "Test Post"
    description "Testing"
    url "http://www.blah.com"
  end
end
