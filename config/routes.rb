Rails.application.routes.draw do
  devise_for :users, :path_names => {sign_in: "login", sign_out: "logout"} 
                     
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/mission'
  get '/users/sign_up'
  get '/users/login'
  root 'static_pages#home'
  resources :users
end 
