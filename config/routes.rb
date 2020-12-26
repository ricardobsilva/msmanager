Rails.application.routes.draw do
  root 'customers#index'
  devise_for :users
  resources :customers do
    post "validate_email", to: 'customers#validate_email', on: :collection
    post "validate_cnpj_cpf", to: 'customers#validate_cnpj_cpf', on: :collection
  end
  resources :service_orders do
    get 'print', to: 'service_orders#print_service_order', on: :member, defaults: {format: :pdf}
  end
  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
