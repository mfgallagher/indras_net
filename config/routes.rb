Rails.application.routes.draw do
  devise_for :users, :path_names => {sign_in: "login", sign_out: "logout"} ,
                     :controllers => {registrations: "registrations"}
                    
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/mission'
  root 'static_pages#home'
  resources :users
end 
