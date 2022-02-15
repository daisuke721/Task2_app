Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'

  # devise_for :users, :controllers => {
  #   :registrations => 'usres/registrations',
  #   :sessions => 'users/sessions'
  # }

  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
