Rails.application.routes.draw do
  devise_for :users
  devise_for :admin
  devise_for :teachers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"

  resources :groups, only: [:index, :show] do
    resources :lessons, except: [:delete]
    get :invoice
  end

  resources :students, only: :update
  resources :attendees, only: [:index]
end
