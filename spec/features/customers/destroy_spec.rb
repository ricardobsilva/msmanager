require 'rails_helper'

RSpec.describe 'Customers::Destroy', type: :feature do
  scenario 'Destroy a customer' do
    customer = create(:customer)
    user = create(:user)
    sign_in user

    visit customers_path

    expect click_link 'Deletar'
  end
end