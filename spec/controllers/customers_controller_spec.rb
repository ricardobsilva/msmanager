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
end