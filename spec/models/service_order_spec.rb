require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do
  it { is_expected.to validate_presence_of(:issue_reported) }
  it { is_expected.to belong_to(:vehicle) }
  it { is_expected.to have_many(:budgets).dependent(:destroy) }
  it { is_expected.to have_many(:services).through(:budgets) }
  it { is_expected.to accept_nested_attributes_for(:budgets) }
end
