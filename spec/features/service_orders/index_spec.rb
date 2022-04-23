require 'rails_helper'

RSpec.describe 'ServiceOrders::Index', type: :feature do
  scenario 'List service orders' do
    user = create(:user)
    customer = create(:customer)
    vehicle = create(:vehicle, customer: customer)
    service_order = create(:service_order, vehicle: vehicle)

    sign_in user
    visit service_orders_path

    expect(page).to have_link('Cadastrar Ordem de Serviço', href: new_service_order_path)
    expect(page).to have_content('Número')
    expect(page).to have_content('Problema')
    expect(page).to have_content('Cliente')
    expect(page).to have_content('Data/Hora de Criação')
    expect(page).to have_content('Ações')
    expect(page).to have_link('Imprimir', href: print_service_order_path(service_order))
    expect(page).to have_link('Editar', href: edit_service_order_path(service_order))
    expect(page).to have_link('Deletar', href: service_order_path(service_order))
  end
end
