Rails.application.routes.draw do
  resources :categories
  get 'sessions/new'

  resources :locations
  
  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :courses do
    member do
      get :categories
      post :category_add
      post :category_remove
    end
  end

  resources :categories do
    member do
      get :courses
      post :course_add
      post :course_remove
    end
  end


  resources :users
end
