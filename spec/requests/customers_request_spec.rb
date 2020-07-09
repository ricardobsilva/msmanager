require 'rails_helper'

RSpec.describe CustomersController, type: :request do

  describe "GET #index" do
    it "returns http success" do
      get customers_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get new_customer_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context 'when a customer was created' do
      it "returns 302 status code" do
        customer_params = attributes_for(:customer)

        post customers_path, params: { customer: customer_params }, headers: {}

        expect(response).to have_http_status(:found)
      end
    end
  end
end
