FactoryBot.define do
  factory :customer do
    sequence(:name){|n| "Customer #{n}"}
    sequence(:phone_number) { |n| "82988889837#{n}" }
    sequence(:second_phone_number) { |n| "82988889837#{n}" }
    sequence(:email) { |n| "customer#{n}@hey.com" }
    sequence(:cnpj_cpf) { |n| n }
  end
end
