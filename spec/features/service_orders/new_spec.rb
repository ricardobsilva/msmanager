require 'rails_helper'

RSpec.describe 'ServiceOrders::New', type: :feature do
  xscenario 'New Service Order Form' do
    customer = create(:customer)
    vehicle = create(:vehicle, customer: customer)
    service_order = create(:service_order, vehicle: vehicle)
    user = create(:user)
    sign_in user

    visit new_service_order_path

    within('form') do
      fill_in 'service_order[protocol_number]', with: service_order.protocol_number
      fill_in 'service_order[issue_reported]', with: service_order.issue_reported
      fill_in 'service_order[observation]', with: service_order.observation

      click_button 'Salvar'
    end
  end
end
