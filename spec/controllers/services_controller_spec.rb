require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  describe 'post #create' do
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
  describe 'GET #new' do
    context 'ao acessar new' do
      it 'new template' do
        user = create(:user)
        sign_in user
        
        get :new

        expect(response).to render_template(:new)
      end
    end
  end
  describe '#show' do
    context 'quando criado serviço' do
      it 'redirect to show' do
        user = create(:user)
        sign_in user
        service = create(:service, name: "Alinhamento")
       
        get :show, params: { id: service.id }

        expect(Service.last.name).to eq("Alinhamento")
        expect(response).to render_template(:show)
      end
    end
  end
end