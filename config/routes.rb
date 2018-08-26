Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    
    get '/workouts' => 'workouts#index'
    get '/workouts/new' => 'workouts#new'
    post 'workouts' => 'workouts#create'
    get '/workouts/:id' => 'workouts#show'
    get '/workouts/:id/edit' => 'workouts#edit'
    patch '/workouts/:id' => 'workouts#update'
    delete '/workouts/:id' => 'workouts#destroy'

    post '/users' => 'users#create'
    get '/users/:id/edit' => 'users#edit'
    patch '/users/:id' => 'users#update'
    
    post '/sessions' => 'sessions#create'


    get '/user_plans' => 'user_plans#index'
    get '/user_plans/new' => 'user_plans#new'
    post '/user_plans' => 'user_plans#create'
    get '/user_plans/:id' => 'user_plans#show'
    get '/user_plans/:id/edit' => 'user_plans#edit'
    patch '/user_plans/:id' => 'user_plans#update'
    delete '/user_plans/:id' => 'user_plans#destroy'

    get '/plans' => 'plans#index'
    get '/plans/new' => 'plans#new'
    post '/plans' => 'plans#create'
    get 'plans/:id' => 'plans#show'
    get 'plans/:id/edit' => 'plans#edit'
    patch 'plans/:id' => 'plans#update'
    delete 'plans/:id' => 'plans#destroy'

    get '/swims' => 'swims#index'
    get '/swims/new' => 'swims#new'
    post '/swims' => 'swims#create'
    get 'swims/:id' => 'swims#show'
    get 'swims/:id/edit' => 'swims#edit'
    patch 'swims/:id' => 'swims#update'
    delete 'swims/:id' => 'swims#destroy'
  end
end

