require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'when access index' do
    it 'reder index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'assigns customers' do
      customer1 = create(:customer)
      customer2 = create(:customer)

      get :index

      expect(assigns(:customers)).to eq([customer1, customer2])
    end
  end

  describe 'when access new' do
    it 'render new template' do
      get :new

      expect(response).to render_template(:new)
    end

    it 'assigns new customer' do
      get :new

      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe '#create' do
    context 'with valid atributes' do
      it 'create a new customer' do
        customer_params = attributes_for(:customer)

        post :create, params: { customer: customer_params }

        expect(Customer.count).to eq(1)
      end

      it 'redirect to list customers' do
        customer_params = attributes_for(:customer)

        post :create, params: { customer: customer_params }

        expect(response).to redirect_to customers_path
      end
    end

    context 'with valid attributes' do
      it 'dont create a new customer' do
        invalid_customer_params = attributes_for(:customer, name: nil)

        post :create, params: { customer: invalid_customer_params }

        expect(Customer.count).to eq(0)
      end

      it 'redirect to new template' do
        invalid_customer_params = attributes_for(:customer, name: nil)

        post :create, params: { customer: invalid_customer_params }

        expect(response).to render_template(:new)
      end
    end
  end
end