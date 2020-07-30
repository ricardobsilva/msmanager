require 'rails_helper'

RSpec.describe Customer, type: :model do
  it{ is_expected.to have_one(:address).dependent(:destroy) }

  it { is_expected.to accept_nested_attributes_for(:address) }
end
