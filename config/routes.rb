Rails.application.routes.draw do
  devise_for :users
  devise_for :admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"

  resources :subjects do
    resources :groups
  end

end
