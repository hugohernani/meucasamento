Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :accounts

  get 'index', to: 'home#index', as: :index

  resources :notifications

#  root to: 'home#index', TODO While the home page for choosing a template is not ready...
  constraints EventSubdomainConstraint.new do
    root to: 'wedding/events#index'
    scope module: :wedding do
      resources :events
    end
    scope path: :casamento, module: :wedding, as: :wedding do
      resources :supports, only: [:index], path: 'presente' do
        collection do
          post 'show_products/:store_id', to: 'supports#show_products', as: :show_products
          post 'show_product/:product_id', to: 'supports#show_product', as: :show_product
          post 'update_product/:product_id', to: 'supports#update_product', as: :update_product
        end
        scope module: 'supports' do
          resource :orders, only: [:create, :new]
        end
      end
    end
  end
  root to: redirect(subdomain: 'hugoeluana')
end
