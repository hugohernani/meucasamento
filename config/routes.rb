Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :accounts

  get 'index', to: 'home#index', as: :index

  resources :notifications

#  root to: 'home#index', TODO While the home page for choosing a template is not ready...
  constraints EventSubdomainConstraint.new do
    root to: 'wedding/events#index'
    scope module: :wedding do
      resources :events do
        post 'gallery_images', on: :collection
      end
    end
    scope path: :casamento, module: :wedding, as: :wedding do
      scope module: :events do
        resources :blog, only: [:index]
        scope module: :blog, path: 'blog' do
          resources :posts, only: [:show]
        end
      end
      resources :supports, only: [:index], path: 'presente' do
        collection do
          post 'show_products/:store_id', to: 'supports#show_products', as: :show_products
          post 'show_product/:product_id', to: 'supports#show_product', as: :show_product
          post 'update_product/:product_id', to: 'supports#update_product', as: :update_product
          get 'doar_valor_do_produto/:product_id', to: 'supports#donate_product_price', as: :donate_product_price
        end
        scope module: 'supports' do
          resource :orders, only: [:create, :new]
        end
      end
    end
  end
  root to: redirect(subdomain: 'hugoeluana')
end
