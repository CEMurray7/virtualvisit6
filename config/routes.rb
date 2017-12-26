Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :users
  resources :sessions
  resources :doctors_sessions
  resources :appointments
  resources :charges
  root to: 'pages#home'
  # get "/pages/:page" => "pages#show"
  get "/pages/FAQ" => "pages#FAQ", as: :faq
  get "/pages/contact" =>"pages#contact"
end
