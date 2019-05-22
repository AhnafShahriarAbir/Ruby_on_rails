Rails.application.routes.draw do
  root 'static_pages#home', controller: "application#index"
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
      post :courses_thumbsup
      post :courses_thumbsdown 
    end
  end
  resources :users

  resources :courses do
    resources :likes
  end

  resources :contact, only: [:new, :create, :edit ]
end
