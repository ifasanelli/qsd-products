Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :periodicities, only: %i[index new create edit update]
  resources :product_types, only: %i[index create edit update]
  resources :plans, only: %i[index create edit update] do
    post 'unavailable', 'available', on: :member
  end
  resources :prices, only: %i[index new create show]

  namespace 'api' do
    namespace 'v1' do
      resources :product_types, only: %i[index]
      resources :plans, only: %i[index show] do
        resources :prices, only: %i[index]
      end
    end
  end
end
