FactoryBot.define do
  factory :service_order do
    protocol_number { "MyString" }
    issue_reported { "MyText" }
    observation { "MyText" }
    customer { nil }
  end
end
