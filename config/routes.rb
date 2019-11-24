Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'd',
             :path_names => {sign_in: "login", sign_out: "logout"} 
  resources :users, only: [:show]
                     
 
  get 'static_pages/help'
  get 'static_pages/mission'
  get '/users/sign_up'
  get '/users/login'
  get 'users/id' => 'users#show'
  root 'static_pages#home'
  
end 
