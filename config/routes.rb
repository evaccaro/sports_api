Rails.application.routes.draw do
  resources :players
  resources :positions
  resources :teams
  resources :sports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
