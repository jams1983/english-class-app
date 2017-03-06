Rails.application.routes.draw do
  devise_for :users
  devise_for :admin
  devise_for :teachers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"

  resources :subjects, only: [:index] do
    resources :groups, only: [:index]
  end

end
