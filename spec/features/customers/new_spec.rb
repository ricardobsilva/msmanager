require 'rails_helper'

RSpec.describe 'Customers::New', type: :feature do
  scenario 'New customer Form' do
    customer = build(:customer)

    visit new_customer_path

    within("form") do
      fill_in 'customer[name]', with: customer.name
      fill_in 'customer[email]', with: customer.email
      fill_in 'customer[phone_number]', with: customer.phone_number
      fill_in 'customer[second_phone_number]', with: customer.second_phone_number

      click_button 'Salvar'
    end
  end

  it 'the page must have the following elements ' do
    visit new_customer_path

    expect(page).to have_content('Clientes')
    expect(page).to have_content('Nome')
    expect(page).to have_content('Email')
    expect(page).to have_content('Cnpj/cpf')
    expect(page).to have_button('Salvar')
    expect(page).to have_link('Cancelar')
  end
end