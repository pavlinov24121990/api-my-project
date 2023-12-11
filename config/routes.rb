# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :products, only: %i[index create show destroy update]
        resources :companies, only: %i[index update]
      end
      resources :products, only: %i[index]
      resources :companies, only: %i[index]
      resources :registrations, only: %i[create]
      resources :sessions, only: %i[create]
    end
  end
  root to: redirect('/api-docs')
end
