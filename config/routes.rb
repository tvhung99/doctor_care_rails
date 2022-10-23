# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/admin', to: 'admin/top#index'

  resources :clinics
  resources :specialties

  namespace :admin do
    resources :users
    resources :clinics
    resources :specialties

    resources :clinic_specialty_mappings
    resources :specialty_issues, only: [:create, :destroy]
  end

end
