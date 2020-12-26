require 'rails_helper'

RSpec.describe ServiceOrdersController, type: :controller do
  describe 'GET #index' do
    it 'render index template' do
      user = create(:user)
      sign_in user

      get :index

      expect(response).to render_template(:index)
    end

    it 'assigns service orders' do
      customer = create(:customer)
      vehicle = create(:vehicle, customer: customer)
      service_order1 = create(:service_order, vehicle: vehicle)
      service_order2 = create(:service_order, vehicle: vehicle)
      user = create(:user)
      sign_in user

      get :index

      expect(assigns(:service_orders)).to eq([service_order1, service_order2])
    end
  end

  describe 'GET #new' do
    it 'render new template' do
      user = create(:user)
      sign_in user

      get :new

      expect(response).to render_template(:new)
    end

    it 'assigns new customer' do
      user = create(:user)
      sign_in user

      get :new

      expect(assigns(:service_order)).to be_a_new(ServiceOrder)
    end
  end

  describe 'GET #edit' do
    it 'render EDIT template' do
      user = create(:user)
      customer = create(:customer)
      vehicle = create(:vehicle, customer: customer)
      service_order = create(:service_order, vehicle: vehicle)
      sign_in user

      get :edit, params: { id: service_order.id }

      expect(response).to render_template(:edit)
    end

    it 'assigns a service order' do
      user = create(:user)
      customer = create(:customer)
      vehicle = create(:vehicle, customer: customer)
      service_order = create(:service_order, vehicle: vehicle)
      sign_in user

      get :edit, params: { id: service_order.id }

      expect(assigns(:service_order)).to eq(service_order)
    end
  end

  describe 'PUT #update' do
    context 'when update a service order' do
      it 'redirect to show' do
        user = create(:user)
        customer = create(:customer)
        vehicle = create(:vehicle, customer: customer)
        service_order = create(:service_order, vehicle: vehicle)
        params = attributes_for(:service_order)
        sign_in user

        put :update, params: { id: service_order.id, service_order: params}

        expect(response).to redirect_to(service_order_path(service_order))
      end
    end

    context 'when do not update a service order' do
      it 'render edit template' do
        user = create(:user)
        customer = create(:customer)
        vehicle = create(:vehicle, customer: customer)
        service_order = create(:service_order, vehicle: vehicle)
        params = attributes_for(:service_order, issue_reported: nil)
        sign_in user

        put :update, params: { id: service_order.id, service_order: params}

        expect(response).to render_template(:edit)
      end
    end
  end
end
