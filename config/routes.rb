Rails.application.routes.draw do
  resources :projects
  resources :users
  root 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/sign_in', to: 'users#new'
  get    '/log_in',   to: 'sessions#new'
  post   '/log_in',   to: 'sessions#create'
  delete '/log_out',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
