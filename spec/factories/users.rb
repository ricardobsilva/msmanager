FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@gmail.com" }
    password { '123123' }
  end
end
