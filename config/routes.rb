Rails.application.routes.draw do
  resources :billing
  resources :outlay
  resources :merchandiseres
  resources :product
  resources :client
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
