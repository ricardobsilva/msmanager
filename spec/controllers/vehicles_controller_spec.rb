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
end