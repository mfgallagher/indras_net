Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd',
             :path_names => {sign_in: "login", sign_out: "logout"} 
  
                     
  get "static_pages/help", to: "static_pages#help", as: "help"
  get "static_pages/mission", to: "static_pages#mission", as: "mission"
  get '/users/sign_up'
  get '/users/login'
  get "/questions/view", to: "questions#view", as: "view"
  root 'static_pages#home'
  resources :users, only: [:show]
  resources :questions, only: [:create, :destroy]
end 
