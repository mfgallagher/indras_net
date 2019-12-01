Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd',
             :path_names => {sign_in: "login", sign_out: "logout"} 
  
                     
 
  get 'static_pages/help'
  get 'static_pages/mission'
  get '/users/sign_up'
  get '/users/login'
  get 'users/id' => 'users#show'
  root 'static_pages#home'
  resources :users, only: [:show]
  resources :questions, only: [:create, :destroy]
end 
