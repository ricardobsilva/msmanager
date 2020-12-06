FactoryBot.define do
  factory :vehicle do
    plate { "MyString" }
    year { "MyString" }
    chassis { "MyString" }
    model { "MyString" }
    brand { "MyString" }
    customer { nil }
  end
end
