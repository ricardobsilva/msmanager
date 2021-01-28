require 'rails_helper'

RSpec.describe Service, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:price) }

  it { is_expected.to have_many(:budgets) }
  it { is_expected.to have_many(:service_orders).through(:budgets) }
end
