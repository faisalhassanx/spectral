Rails.application.routes.draw do
  
  # get '/recipes', to: 'recipes#index'
  
  # get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  # post '/recipes', to: 'recipes#create'
  
  # get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id', to: 'recipes#update'
  
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  
  # delete '/recipes/:id', to: 'recipes#destroy'
 
 resources :styles, only: [:new, :create, :show]
 
 resources :ingredients, only: [:new, :create, :show]
  
  resources :chefs, except: [:new]
  get   '/register', to: "chefs#new"
  get   '/login',    to: "sessions#new"
  post  '/login',    to: "sessions#create"
  get   '/logout',   to: "sessions#destroy"
  
  resources :recipes do
    member do
      post 'like'
    end
  end
  
  resources :recipes
  
  root 'pages#home'

end
