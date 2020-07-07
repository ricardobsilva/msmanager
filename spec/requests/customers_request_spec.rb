require 'rails_helper'

RSpec.describe CustomersController, type: :request do

  describe "GET #index" do
    it "returns http success" do
      get customers_path

      expect(response).to have_http_status(:ok)
    end
  end
end
