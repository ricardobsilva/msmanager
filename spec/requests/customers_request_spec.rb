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

  describe "POST #validate_email" do
    context 'when find some email' do
      it 'must return 200 http status code' do
        customer = create(:customer)

        post "/customers/validate_email", params: {validate: {email: customer.email}}

        expect(response).to have_http_status(:ok)
      end

      it  'must return a body response with following attributes' do
        customer = create(:customer)

        post "/customers/validate_email", params: {validate: {email: customer.email}}

        expect(JSON.parse(response.body)).to have_key('avaiable')
        expect(JSON.parse(response.body)['avaiable']).to eq(false)
      end
    end

    context 'when didnt find some email' do
      it 'must return 200 http status code' do
        invalid_email = 'invalid'

        post "/customers/validate_email", params: {validate: {email: invalid_email}}

        expect(response).to have_http_status(:ok)
      end

      it  'must return a body response with following attributes' do
        invalid_email = 'invalid'

        post "/customers/validate_email", params: {validate: {email: invalid_email}}

        expect(JSON.parse(response.body)).to have_key('avaiable')
        expect(JSON.parse(response.body)['avaiable']).to eq(true)
      end
    end
  end

  describe 'POST #validate_cnpj_cpf' do
    context 'when find some cnpj_cpf' do
      it 'must return 200 http status code' do
        customer = create(:customer)

        post "/customers/validate_cnpj_cpf", params: {validate: {cnpj_cpf: customer.cnpj_cpf}}

        expect(response).to have_http_status(:ok)
      end

      it  'must return a body response with following attributes' do
        customer = create(:customer)

        post "/customers/validate_cnpj_cpf", params: {validate: {cnpj_cpf: customer.cnpj_cpf}}

        expect(JSON.parse(response.body)).to have_key('avaiable')
        expect(JSON.parse(response.body)['avaiable']).to eq(false)
      end
    end

    context "when don't find some cnpj_cpf" do
      it 'must return 200 http status code' do
        invalid_cnpj_cpf = 'invalid'

        post "/customers/validate_cnpj_cpf", params: {validate: {cnpj_cpf: invalid_cnpj_cpf}}

        expect(response).to have_http_status(:ok)
      end

      it  'must return a body response with following attributes' do
        invalid_cnpj_cpf = 'invalid'

        post "/customers/validate_cnpj_cpf", params: {validate: {cnpj_cpf: invalid_cnpj_cpf}}

        expect(JSON.parse(response.body)).to have_key('avaiable')
        expect(JSON.parse(response.body)['avaiable']).to eq(true)
      end
    end
  end
end
