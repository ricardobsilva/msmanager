FactoryBot.define do
  factory :address do
    cep { "MyString" }
    street { "MyString" }
    number { "MyString" }
    complement { "MyString" }
    neighborhood { "MyString" }
    city { "MyString" }
  end
end
