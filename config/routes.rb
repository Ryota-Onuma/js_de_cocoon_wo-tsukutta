Rails.application.routes.draw do
  resources :projects, only: [:index, :show,:edit,:create,:update,:new]
  resources :tasks, only: [:create,:update]
  resources :items, only: [:create,:update]
  root to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
