require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'when access index' do
    it 'reder index template' do
      user = create(:user)
      sign_in user

      get :index

      expect(response).to render_template(:index)
    end

    it 'assigns customers' do
      customer1 = create(:customer)
      customer2 = create(:customer)
      user = create(:user)
      sign_in user

      get :index

      expect(assigns(:customers)).to eq([customer1, customer2])
    end
  end

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

      expect(assigns(:customer)).to be_a_new(Customer)
    end
  end

  describe '#create' do
    context 'with valid atributes' do
      it 'create a new customer' do
        user = create(:user)
        sign_in user
        customer_params = attributes_for(:customer)

        post :create, params: { customer: customer_params }

        expect(Customer.count).to eq(1)
      end

      it 'redirect to details customers' do
        user = create(:user)
        sign_in user
        customer_params = attributes_for(:customer)

        post :create, params: { customer: customer_params }

        expect(response).to redirect_to customer_path(Customer.last)
      end
    end

    context 'with valid attributes' do
      it 'dont create a new customer' do
        invalid_customer_params = attributes_for(:customer, name: nil)

        post :create, params: { customer: invalid_customer_params }

        expect(Customer.count).to eq(0)
      end

      it 'redirect to new template' do
        user = create(:user)
        sign_in user
        invalid_customer_params = attributes_for(:customer, name: nil)

        post :create, params: { customer: invalid_customer_params }

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#edit' do
    it 'assigns a customer to edit' do
      customer = create(:customer)
      user = create(:user)
      sign_in user

      get :edit, params: {id: customer.id}

      expect(assigns(:customer)).to eq(customer)
    end

    it 'render edit template' do
      customer = create(:customer)
      user = create(:user)
      sign_in user

      get :edit, params: {id: customer.id}

      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    context 'when pass valid attributes' do
      it 'must redirect to edit view' do
        customer = create(:customer)
        user = create(:user)
        sign_in user
        new_address = attributes_for(:address)
        params = attributes_for(:customer, name: 'new name', address_attributes: new_address)

        put :update, params: {id: customer.id, customer: params}

        expect(response).to redirect_to(edit_customer_path(customer))
      end
    end

    context 'when pass invalid attributes' do
      it 'must redirect to edit view' do
        customer = create(:customer)
        user = create(:user)
        sign_in user
        new_address = attributes_for(:address)
        params = attributes_for(:customer, name: nil, address_attributes: new_address)

        put :update, params: {id: customer.id, customer: params}

        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    context 'when destroy a customer' do
      it 'remove the customer on database' do
        customer = create(:customer)
        user = create(:user)
        sign_in user

        expect do
          delete :destroy, params: {id: customer.id}
        end.to change(Customer, :count).by(-1)
      end

      it 'redirect to customers list' do
        user = create(:user)
        sign_in user
        customer = create(:customer)

        delete :destroy, params: {id: customer.id}

        expect(response).to redirect_to(customers_path)
      end
    end
  end
end