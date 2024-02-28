Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # resources :students, only: %i[create destroy]
  # resources :schools, only: [] do
  #   resources :classes, only: [:index] do
  #     resources :students, only: [:index]
  #   end
  # end

  post '/students', to: 'students#create'
  delete '/students/:id', to: 'students#destroy'
  get '/schools/:id/classes/:id/students', to: 'students#index'
  get '/schools/:id/classes/', to: 'klasses#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
