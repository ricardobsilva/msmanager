require 'rails_helper'

RSpec.describe Customer, type: :model do
  it{is_expected.to validate_presence_of(:name)}
  it{is_expected.to validate_presence_of(:email)}
  it{is_expected.to validate_presence_of(:phone_number)}
  it{is_expected.to validate_presence_of(:cnpj_cpf)}
  it{is_expected.to validate_uniqueness_of(:cnpj_cpf)}

  it{ is_expected.to have_one(:address).dependent(:destroy) }
  it{ is_expected.to have_many(:vehicles) }

  it { is_expected.to accept_nested_attributes_for(:address) }
end
