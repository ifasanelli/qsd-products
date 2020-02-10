Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :periodicities, only: %i[index new create edit update]
  resources :product_types, only: %i[index new create show edit update]
  resources :plans, only: %i[index new create show]
  resources :prices, only: %i[index new create show]

  namespace 'api' do
    namespace 'v1' do
      resources :product_types, only: %i[index]
      resources :plans, only: %i[index]
      resources :periodicities, only: %i[index]
    end
  end
end
