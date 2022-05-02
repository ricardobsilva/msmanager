require 'rails_helper'

RSpec.describe 'Customers::New', type: :feature do
  xscenario 'New customer Form' do
    customer = build(:customer)
    user = create(:user)
    sign_in user

    visit new_customer_path

    within("form") do
      fill_in 'customer[name]', with: customer.name
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[phone_number]', with: customer.phone_number
      fill_in 'customer[second_phone_number]', with: customer.second_phone_number

      click_button 'Salvar'
    end
  end
end