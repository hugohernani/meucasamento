Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :accounts

  get 'index', to: 'home#index', as: :index

#  root to: 'home#index', TODO While the home page for choosing a template is not ready...
  constraints EventSubdomainConstraint.new do
    root to: 'wedding/events#index'
    scope module: :wedding do
      resources :events
    end
    scope path: :casamento, module: :wedding, as: :wedding do
      resources :supports, only: [:index], path: 'presente'
    end
  end
  root to: redirect(subdomain: 'hugoeluana')

end
