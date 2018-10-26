Rails.application.routes.draw do

  resources :journeys, only: [:index, :new, :create, :show]

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
