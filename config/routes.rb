Rails.application.routes.draw do
  get 'index', to: 'home#index', as: :index

  root to: 'home#index'
end
