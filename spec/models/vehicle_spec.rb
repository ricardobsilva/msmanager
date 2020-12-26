require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it{ is_expected.to belong_to(:customer) }

  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:plate) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:chassis) }
  it { is_expected.to have_many(:service_orders) }

  describe 'uniqueness validation' do
    it 'plate' do
      customer = create(:customer)
      create(:vehicle, plate: 'NMN1908', customer: customer)

      is_expected.to validate_uniqueness_of(:plate)
    end
  end
end
