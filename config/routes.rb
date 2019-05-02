Rails.application.routes.draw do
  
  resources :coordinators
  get 'sessions/new'

  
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
  
 

  resources :locations, :categories, :courses do
    member do
      get :categories
      get :courses
      post :course_add
      post :course_remove
      post :category_add
      post :category_remove
    end
  end

  resources :users
end
