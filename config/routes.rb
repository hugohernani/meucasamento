Rails.application.routes.draw do
  devise_for :accounts

  get 'index', to: 'home#index', as: :index

  root to: 'home#index', constraints: EventSubdomainConstraint.new
  root to: redirect(subdomain: Rails.env.development?? 'hugoeluana' : 'demo')
end
