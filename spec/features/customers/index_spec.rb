require 'rails_helper'

RSpec.describe 'Customers::Index', type: :feature do
  xscenario 'List customers' do
    user = create(:user)
    customer = create(:customer)

    sign_in user
    visit customers_path

    expect(page).to have_link('Cadastrar novo cliente', href: new_customer_path)
    expect(page).to have_content('Clientes')
    expect(page).to have_content('Nome')
    expect(page).to have_content('Email')
    expect(page).to have_content('CNPJ/CPF')
    expect(page).to have_link('Editar', href: edit_customer_path(customer))
    expect(page).to have_link('Deletar', href: customer_path(customer))
    expect(page).to have_current_path(customers_path)
  end
end