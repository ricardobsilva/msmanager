require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  describe 'when access new' do
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

      expect(assigns(:vehicle)).to be_a_new(Vehicle)
    end
  end

  describe '#create' do
    context 'with valid atributes' do
      it 'create a new customer' do
        user = create(:user)
        customer = create(:customer)
        sign_in user
        vehicle_params = attributes_for(:vehicle, customer_id: customer.id)

        post :create, params: { vehicle: vehicle_params }

        expect(Vehicle.count).to eq(1)
      end

      it 'redirect to list customers' do
        user = create(:user)
        customer = create(:customer)
        sign_in user
        vehicle_params = attributes_for(:vehicle, customer_id: customer.id)

        post :create, params: { vehicle: vehicle_params }

        expect(response).to redirect_to edit_vehicle_path(Vehicle.last)
      end
    end

    context 'with invalid atributes' do
      it 'render new template' do
        user = create(:user)
        customer = create(:customer)
        sign_in user
        vehicle_params = attributes_for(:vehicle, customer_id: customer.id, plate: nil)

        post :create, params: { vehicle: vehicle_params }

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    context 'with invalid atributes' do
      it 'must return to edit page' do
        user = create(:user)
        customer = create(:customer)
        vehicle = create(:vehicle, customer: customer)
        sign_in user
        vehicle_params = attributes_for(:vehicle, customer_id: customer.id)

        put :update, params: { id: vehicle.id, vehicle: vehicle_params }

        expect(response).to redirect_to edit_vehicle_path(vehicle)
      end
    end
  end
end
