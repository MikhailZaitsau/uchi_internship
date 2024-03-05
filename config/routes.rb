# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  post '/students', to: 'students#create'
  delete '/students/:id', to: 'students#destroy'
  get '/schools/:school_id/classes/:class_id/students', to: 'students#index'
  get '/schools/:school_id/classes/', to: 'groups#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
