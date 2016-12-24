Rails.application.routes.draw do
    
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

  get 'donate' => 'static_pages#donate'

  get 'involved' => 'static_pages#involved'

  get 'careers' => 'static_pages#careers'

  get 'blog' => 'static_pages#blog'

  get 'jobs' => 'static_pages#jobs'

  get 'signup'   => 'users#new'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
end
