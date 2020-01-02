Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd',
             :path_names => {sign_in: "login", sign_out: "logout"} 
                     
  get "static_pages/help", to: "static_pages#help", as: "help"
  get "static_pages/mission", to: "static_pages#mission", as: "mission"
  get "communities", to: "communities#index", as: "communities"
  get '/users/sign_up'
  get '/users/login'
  get "communities/:id/join", to: "community_users#new", as: "community_join"
  post "communities/:id", to: "communities#show"
  
  root 'static_pages#home'
  resources :communities, only: [:create, :show, :index]
  resources :users, only: [:show]
  resources :questions, only: [:create, :destroy, :show, :index] do
    resources :answers, only: [:create, :destroy, :show, :index]
  end
end 
