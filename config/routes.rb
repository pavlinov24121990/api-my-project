# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index create]
      resources :categories, only: %i[index create]
      resources :companies, only: %i[index create]
      resources :registrations, only: %i[create]
      resources :sessions, only: %i[create]
    end
  end
  root to: redirect('/api-docs')
end
