require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  describe 'GET #create' do
    context 'Quando criar um serviço' do
      it 'redireciona para página de detalhes de serviço' do
        user = create(:user)
        sign_in user
        service_params = attributes_for(:service, name: "Troca de óleo", user_id: user.id)
       
        post :create, params: { service: service_params }
       
        expect(Service.last.name).to eq("Troca de óleo")
        expect(response).to redirect_to service_path(Service.last)

      end
    end
    context 'Quando serviço não for salvo' do
      it 'redireciona para página de cadastro' do
        user = create(:user)
        sign_in user

        invalid_params = attributes_for(:service, name: nil)

        post :create, params: {service: invalid_params}

        expect(response).to render_template(:new)
      end
    end
  end
end