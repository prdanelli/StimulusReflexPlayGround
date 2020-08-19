Rails.application.routes.draw do
  resources :todos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "todos#index"
  resources :todos do
    member do
      patch :move
    end
  end
end
