require 'rails_helper'

RSpec.describe ServiceOrdersController, type: :controller do
  describe 'when access index' do
    it 'reder index template' do
      user = create(:user)
      sign_in user

      get :index

      expect(response).to render_template(:index)
    end

    it 'assigns service orders' do
      customer = create(:customer)
      service_order1 = create(:service_order, customer: customer)
      service_order2 = create(:service_order, customer: customer)
      user = create(:user)
      sign_in user

      get :index

      expect(assigns(:service_orders)).to eq([service_order1, service_order2])
    end
  end
end