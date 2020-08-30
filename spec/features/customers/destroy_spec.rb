require 'rails_helper'

RSpec.describe 'Customers::Destroy', type: :feature do
  scenario 'Destroy a customer' do
    customer = create(:customer)

    visit customers_path

    expect click_link 'Deletar'
  end
end