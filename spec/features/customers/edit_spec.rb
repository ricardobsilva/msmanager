require 'rails_helper'

RSpec.describe 'Customers::Edit', type: :feature do
  xscenario 'Edit customer Form' do
    customer = create(:customer)
    user = create(:user)
    sign_in user

    visit edit_customer_path(customer)

    within("form") do
      fill_in 'customer[name]', with: customer.name
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[phone_number]', with: customer.phone_number
      fill_in 'customer[second_phone_number]', with: customer.second_phone_number

      click_button 'Salvar'
      expect(page).to have_link('Cancelar', href: customers_path)
    end
  end
end