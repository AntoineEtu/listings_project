Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
      devise_for :users
      mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
      root 'homepage#index'
      resources :listings
      resources :contacts
      namespace :account do
        resources :contacts
        resources :messages
        resources :user, only: [:index, :update]
      end
    end
    resources :listings
  end
