Rails.application.routes.draw do
  resources :groups
  resources :projects
  resources :users
  resources :tasks
  root 'static_pages#landing'
  get  '/second_index', to: 'projects#second_index'
  get    '/home',   to: 'static_pages#home'
  get    '/sign_in', to: 'users#new'
  get    '/log_in',   to: 'sessions#new'
  post   '/log_in',   to: 'sessions#create'
  delete '/log_out',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
