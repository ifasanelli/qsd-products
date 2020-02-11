Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :periodicities, only: %i[index new create edit update]
  resources :product_types, only: %i[index create edit update]
  resources :plans, only: %i[index create edit update] do
    post 'unavailable', 'available', on: :member
  end
  resources :prices, only: %i[index create edit update]

  namespace 'api' do
    namespace 'v1' do
      resources :product_types, only: %i[index]
      resources :plans, only: %i[show] do
        resources :prices, only: %i[index]
      end
      resources :periodicities, only: %i[index]
    end
  end
end
