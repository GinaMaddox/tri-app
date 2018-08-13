Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/workouts' => 'workouts#index'
    post 'workouts' => 'workouts#create'
    get '/workouts/:id' => 'workouts#show'
    patch '/workouts/:id' => 'workouts#update'
    delete '/workouts/:id' => 'workouts#destroy'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
  end
end

